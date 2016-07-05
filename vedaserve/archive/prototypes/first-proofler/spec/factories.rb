FactoryGirl.define do

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password 'foobar23'
    password_confirmation 'foobar23'

    after(:create) { |user| user.confirm! }
  end

  factory :admin do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password 'foobar23'
    password_confirmation 'foobar23'
  end

  factory :research do
    title 'Fancy startup research'
    description 'This is, what I ever wanted to know about my market...'
    user
  end

  factory :topic do
    title 'Whatever'
    research
  end

  factory :question do
    title 'Good question'
    topic
  end
  
  factory :term do
    term 'What a term'
    question
  end
  
  factory :search do
    title 'Cool result'
    question
  end
  
  factory :dataobject do
    title 'Some data'
    result
  end

end
