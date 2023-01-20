class PersonalityScoreService
  class << self
    def calculate!(personality_test_response)
      introvert_score = average_introvert_score(personality_test_response.answers)
      personality_type, score = if Answer.extrovert?(introvert_score)
                                  [PersonalityType.find_by(name: 'Extrovert'), calibrate_score(introvert_score)]
                                elsif Answer.introvert?(introvert_score)
                                  [PersonalityType.find_by(name: 'Introvert'), calibrate_score(introvert_score)]
                                else
                                  [PersonalityType.find_by(name: 'Balanced'), calibrate_score(introvert_score)]
                                end

      personality_test_response.update!(personality_type_id: personality_type.id, score:)
    end

    def introvert?(score)
      score > 50
    end

    def extrovert?(score)
      score < 50
    end

    def balanced?(score)
      score == 50
    end

    def calibrate_score(score)
      # 40% introvert means 60% extrovert
      return 100 - score if score < 50

      score
    end

    private

    def average_introvert_score(answers)
      answers.inject(0) { |sum, e| sum + e.introvert_score } / answers.count
    end
  end
end
