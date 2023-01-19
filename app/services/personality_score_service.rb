class PersonalityScoreService
  class << self
    def calculate!(personality_test_response)
      introvert_score = average_introvert_score(personality_test_response.answers)
      personality_type, score = case introvert_score
                                when 0..49
                                  [PersonalityType.find_by(name: 'Extrovert'), 100 - introvert_score]
                                when 50
                                  [PersonalityType.find_by(name: 'Balanced'), introvert_score]
                                else
                                  [PersonalityType.find_by(name: 'Introvert'), introvert_score]
                                end

      personality_test_response.update!(personality_type_id: personality_type.id, score:)
    end

    private

    def average_introvert_score(answers)
      answers.inject(0) { |sum, e| sum + e.introvert_score } / answers.count
    end
  end
end
