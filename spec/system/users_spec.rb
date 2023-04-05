require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe "ログイン前" do
    describe "ユーザー登録" do
      context "フォームの入力値が正常" do
        it "ユーザー登録が成功する" do
          visit new_user_path
          fill_in "名前", with: user.name
          fill_in "email", with: "user.email"
          fill_in "パスワード", with: "password"
          fill_in "パスワード確認", with: "password"
          click_button "新規登録"
          expect(page).to have_content "ユーザー登録を完了しました"
          expect(current_path).to eq new_plan_path
        end
      end

      context "メールアドレスが未入力" do
        it "ユーザー登録が失敗する" do
          visit new_user_path
          fill_in "名前", with: user.name
          fill_in "email", with: ""
          fill_in "パスワード", with: "password"
          fill_in "パスワード確認", with: "password"
          click_button "新規登録"
          expect(page).to have_content "emailを入力してください"
        end
      end

      context  "登録済メールアドレスを使用" do
        it "ユーザー登録が失敗する" do
          other_user = create(:user)
          visit new_user_path
          fill_in "名前", with: other_user.name
          fill_in "email", with: other_user.email
          fill_in "パスワード", with: "password"
          fill_in "パスワード確認", with: "password"
          click_button "新規登録"
          expect(page).to have_content "emailはすでに存在します"
        end
      end
    end

    describe "マイページ" do
      context "ログインしていない状態" do
        it "マイページへのアクセスが失敗する" do
          visit profile_path(user)
          expect(page).to have_content "ログインしてください"
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe "ログイン後" do
    before { login_as(user) }

    describe 'ユーザー編集' do
      context "フォームの入力値が正常" do
        it "ユーザー編集が成功する" do
          visit profile_path
          click_link "編集"
          fill_in "名前", with: "test"
          fill_in "email", with: "test@example.com"
          fill_in "自己紹介", with: "test"
          click_button "編集"
          expect(page).to have_content "ユーザーを更新しました"
          expect(current_path).to eq profile_path
        end
      end

      context "名前が未入力" do
        it  "ユーザー編集が失敗する" do
          visit profile_path
          click_link "編集"
          fill_in "名前", with: ""
          fill_in "email", with: "text@example.com"
          fill_in "自己紹介", with: "test"
          click_button "編集"
          expect(page).to have_content "名前を入力してください"
          expect(current_path).to eq profile_path
        end
      end
      context "メールアドレスが未入力" do
        it "ユーザー編集が失敗する" do
          visit profile_path
          click_link "編集"
          fill_in "email", with: ""
          click_button "編集"
          expect(page).to have_content "emailを入力してください"
        end
      end

      context "登録済メールアドレスを使用" do
        it "ユーザー編集が失敗する" do
          other_user = create(:user)
          visit profile_path
          click_link "編集"
          fill_in "email", with: other_user.email
          click_button "編集"
          expect(page).to have_content "emailはすでに存在します"
        end
      end
    end
  end
end


