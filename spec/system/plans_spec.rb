require "rails_helper"

RSpec.describe "Plans", type: :system do
  let(:user){ create(:user) }
  let(:plan){ create(:plan) }
  let(:country){ create(:country) }

  describe "プラン作成" do
    context "プラン作成ページでプランを作成" do
      it "プランが作成される" do
        country1 = create(:country)
        country2 = create(:country)

        login_as(user)
        visit new_plan_path
        fill_in "計画名", with: plan.name
        fill_in '国名を入れてください', with: country1.name
        click_button "追加"
        fill_in '国名を入れてください', with: country2.name
        click_button "追加"
        click_button "登録する"
        expect(current_path).to eq plans_path
      end

      context "プランが作成されない" do
        it "プラン名が空の場合" do
          country1 = create(:country)
          country2 = create(:country)

          login_as(user)
          visit new_plan_path
          fill_in "計画名", with: ""
          fill_in '国名を入れてください', with: country1.name
          click_button "追加"
          fill_in '国名を入れてください', with: country2.name
          click_button "追加"
          click_button "登録する"
          expect(page).to have_content "計画を作成できませんでした"
        end
      end

      context "プランが作成されない" do
        it "旅行先が空の場合" do
          country1 = create(:country)
          country2 = create(:country)

          login_as(user)
          visit new_plan_path
          fill_in "計画名", with: plan.name
          click_button "登録する"
          expect(page).to have_content "計画を作成できませんでした"
        end
      end
    end
  end
end