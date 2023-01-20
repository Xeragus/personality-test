FactoryBot.define do
  factory :personality_type do
    trait :introvert do
      name { PersonalityType::NAMES::INTROVERT }
    end

    trait :extrovert do
      name { PersonalityType::NAMES::EXTROVERT }
    end

    trait :balanced do
      name { PersonalityType::NAMES::BALANCED }
    end
  end
end
