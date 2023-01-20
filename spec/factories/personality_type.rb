FactoryBot.define do
  factory :personality_type do
    trait :introvert do
      name { PersonalityType::NAMES::INTROVERT }
    end

    trait :extrovert do
      name { PersonalityType::NAMES::EXTROVERT }
    end
  end
end
