class Form::BudgetsForm < Form::Base
  
  attr_accessor :budgets_attributes

  def save
    Budget.transaction do
      budgets_attributes.each do |attributes|
        Budget.create!(attributes)
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:base, e.message)
    false
  end
end