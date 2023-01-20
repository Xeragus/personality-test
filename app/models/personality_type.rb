class PersonalityType < ApplicationRecord
  has_many :personality_test_responses

  module NAMES
    INTROVERT = :Introvert
    EXTROVERT = :Extrovert
    BALANCED = :Balanced
  end
end
