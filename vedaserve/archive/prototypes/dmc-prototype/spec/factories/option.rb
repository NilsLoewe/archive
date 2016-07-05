FactoryGirl.define do
  factory :option do
    decision
    sequence(:title) { |n| "Option #{n}" }
  end
end
