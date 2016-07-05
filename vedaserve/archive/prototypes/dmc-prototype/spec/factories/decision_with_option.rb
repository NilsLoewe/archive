FactoryGirl.define do
  factory :decision_with_option, class: :decision, parent: :decision do
    after(:create) do |decision, _|
      create(:option, decision: decision)
    end
  end
end
