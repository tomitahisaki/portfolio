# == Schema Information
#
# Table name: budgets
#
#  id              :bigint           not null, primary key
#  amount          :integer
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  plan_country_id :bigint           not null
#
# Indexes
#
#  index_budgets_on_plan_country_id  (plan_country_id)
#
# Foreign Keys
#
#  fk_rails_...  (plan_country_id => plan_countries.id)
#
require 'rails_helper'

RSpec.describe Budget, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
