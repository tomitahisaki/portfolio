require 'rails_helper'

RSpec.describe "Users" type: :system do
  let(:user) { create(:user) }

  describe "ログイン前" do
    describe "ユーザー登録" do
      context "フォームの入力値が正常" do
        it "ユーザー登録が成功する" do
          visit new_user_path
          fill_in "name", with: "user.name"
          fill_in "Email", with: "user.email"
          fill_in "Password", with: "password"
          fill_in "Password confirmation", with: "password"
          click_button "SignUp"
          expect(page).to have_content "User was successfully created."
          expect(current_path).to eq login_path
        end
      end

      context "メールアドレスが未入力" do
        it "ユーザー登録が失敗する" do
          visit new_user_path
          fill_in "Email", with: ""
          fill_in "Password", with: "password"
          fill_in "Password confirmation", with: "password"
          click_button "SignUp"
          expect(page).to have_content "Email can't be blank"
          expect(current_path).to eq users_path
        end
      end

      context  "登録済メールアドレスを使用" do
        it "ユーザー登録が失敗する" do
          other_user = create(:user)
          visit new_user_path
          fill_in "Email", with: other_user.email
          fill_in "Password", with: "password"
          fill_in "Password confirmation", with: "password"
          click_button "SignUp"
          expect(page).to have_content "Email has already been taken"
          expect(current_path).to eq users_path
        end
      end
    end

  end
end