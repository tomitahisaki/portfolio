class Form::BudgetsForm < Form::Base
  
  attr_accessor :budgets_attributes

  def save
    Budget.transaction do
      budgets_attributes.each do |attributes|
        #すでに登録されているかどうかを確認する 探す方法は、plan_country_idとcategory_idを組み合わせて探す
        Budget.find_or_create_by(plan_country_id: attributes[:plan_country_id], category_id: attributes[:category_id]).update!(attributes)
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:base, e.message)
    false
  end
end