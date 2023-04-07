require "rails_helper"

RSpec.describe "Plans", type: :system do
  let(:user){ create(:user) }

  describe "プラン作成" do
    context "プラン作成ページでプランを作成" do
      it "プランが作成される" do
        country1 = create(:country)
        country2 = create(:country)
        user = create(:user)

        login_as(user)
        visit new_plan_path
        fill_in "計画名", with: "test_plan"
        fill_in '国名を入れてください', with: country1.name
        binding.break
        click_button "追加"
        fill_in '国名を入れてください', with: country2.name
        click_button "追加"
        expect(page).to have_content "test_plan"
        expect(current_path).to eq plan_path(plan)
      end
    end
  end
end