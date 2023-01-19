class PersonalityTestResponse < ApplicationRecord
  has_many :personality_test_responses_answers
  has_many :answers, through: :personality_test_responses_answers
  has_one :personality_type, required: false
end
