class PersonalityTestGeneratorService
  class << self
    def generate!(params)
      personality_test_response = PersonalityTestResponse.create!
      params['answers'].each do |answer_id|
        ResponseAnswer.create!(personality_test_response:, answer: Answer.find(answer_id))
      end

      personality_test_response
    end
  end
end
