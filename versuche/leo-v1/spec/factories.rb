FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar23"
    password_confirmation "foobar23"
  end

  factory :category do
    content "Lorem ipsum"
    title "New category"
    color 3
    user
  end

  factory :objective do
    description "Lorem ipsum"
    title "New objective"
    category
  end

  factory :periodic do
    description "Lorem ipsum"
    title "New periodic"
    category
  end

  factory :task do
    title "New Task"
    plan
  end
  
  factory :objective_task, class: "Task" do
    association :plan, factory: :objective
    title "New Task"
  end

  factory :periodic_task, class: "User" do
    association :plan, factory: :periodic
    title "New Task"
  end  

end
