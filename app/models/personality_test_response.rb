class PersonalityTestResponse < ApplicationRecord
  has_many :personality_test_responses_answers, class_name: 'ResponseAnswer'
  has_many :answers, through: :personality_test_responses_answers
  belongs_to :personality_type, required: false
end
