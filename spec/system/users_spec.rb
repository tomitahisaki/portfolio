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
  end
end