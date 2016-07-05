FactoryGirl.define do
  sequence :dashboard_token do
    SecureRandom.urlsafe_base64(16)
  end

  factory :decision do
    title 'New Decision'

    after(:build) do |decision, _|
      decision.admin = build(:admin, decision: decision)
    end

    factory :closed_decision do
      state "closed"
      after(:build) do |decision, _|
        decision.options << create(:option, decision: decision)
        decision.selected_id = decision.options.first.id
      end
    end

    factory :rated_decision do
      state "rate"
      after(:create) do |decision, _|
        decision.facts << create(:fact, decision: decision)
      end
    end

    factory :valued_decision do
      state "rate"
      after(:create) do |decision, _|
        decision.options << create(:option, decision: decision)
      end
    end

    # "with_options" is a function name within factory_girl, thus this method is called with_created_options.
    trait :with_created_options do
      transient do
        options_count 3
      end

      after(:create) do |decision, evaluator|
        create_list(:option, evaluator.options_count, decision: decision, creator: decision.admin)
      end
    end

    trait :with_facts do
      with_created_options

      transient do
        facts_count 3
      end

      after(:create) do |decision, evaluator|
        create_list(:fact, evaluator.facts_count, decision: decision, creator: decision.admin)
      end
    end

    trait :rating do
      state "rate"
    end
  end

  factory :participant do
    name 'John the decider'
    email 'john@decision.inc'
  end

  factory :admin, class: Participant do
    name 'Decision Admin'
    email 'admin@example.com'
  end

  sequence :option_title do |n|
    "Option #{n}"
  end

  factory :option do
    title { generate(:option_title) }
    association :decision

    after(:build) do |option, _|
      option.creator = build(:participant, decision: option.decision) unless option.creator.present?
    end
  end

  sequence :fact_title do |n|
    "Fact #{n}"
  end

  factory :fact do
    title { generate(:fact_title) }
    datatype 'NONE'
    association :decision

    after(:build) do |fact, _|
      fact.creator = build(:participant, decision: fact.decision) unless fact.creator
    end
  end

  factory :image do
    title 'My cool picture'
    association :option
  end

  factory :comment do
    comment 'Hello Proofler'

    after(:build) do |comment, _|
      comment.participant = build(:participant)
      # comment.option = build(:option)
    end
  end

  factory :feeling do
    value '42'

    after(:build) do |feeling, _|
      decision = build(:decision)
      feeling.participant = build(:participant, decision: decision)
      feeling.option = build(:option, decision: decision)
    end
  end

  factory :fact_rating do
    value '17'

    after(:build) do |rating, _|
      decision = build(:decision)
      rating.participant = build(:participant, decision: decision)
      rating.fact = build(:fact, decision: decision)
    end
  end
end
