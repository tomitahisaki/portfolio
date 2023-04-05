require "rails_helper"

RSpec.describe "UserSessions", type: :system do
  let(:user){ create(:user) }

  describe "ログイン前" do
    context "フォームの入力値が正常" do
      it "ログインが成功する" do
        visit login_path
        fill_in "email", with: user.email
        fill_in "パスワード", with: "password"
        click_button "ログイン"
        expect(page).to have_content "ログインしました"
        expect(current_path).to eq new_plan_path
      end
    end

    context "メールアドレスが未入力" do
      it "ログインが失敗する" do
        visit login_path
        fill_in "email", with: ""
        fill_in "パスワード", with: "password"
        click_button "ログイン"
        expect(page).to have_content "ログインに失敗しました"
        expect(current_path).to eq login_path
      end
    end
  end

  describe "ログイン後" do
    context "ログアウトボタンをクリック" do
      it "ログアウトが成功する" do
        login_as(user)
        visit root_path
        find("label[for='label_tag']").click
        click_button "ログアウト"
        expect(page).to have_content "ログアウトしました"
        expect(current_path).to eq root_path
      end
    end
  end
end