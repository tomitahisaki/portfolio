# == Schema Information
#
# Table name: plan_countries
#
#  id         :bigint           not null, primary key
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :bigint           not null
#  plan_id    :bigint           not null
#
# Indexes
#
#  index_plan_countries_on_country_id              (country_id)
#  index_plan_countries_on_plan_id                 (plan_id)
#  index_plan_countries_on_plan_id_and_country_id  (plan_id,country_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (country_id => countries.id)
#  fk_rails_...  (plan_id => plans.id)
#
require 'rails_helper'

RSpec.describe PlanCountry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
