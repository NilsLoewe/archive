FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password "secretpassword"
  end

  factory :hat do
    user
    title "My cool hat"
  end

end
