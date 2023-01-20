class PersonalityScoreService
  def initialize(personality_test_response)
    @personality_test_response = personality_test_response
  end

  def calculate!
    # introvert_score = average_introvert_score(personality_test_response.answers)
    personality_type, score = if average_answer.extrovert?
                                [PersonalityTypeRepository.extrovert, average_answer.personality_score]
                              elsif average_answer.introvert?
                                [PersonalityTypeRepository.introvert, average_answer.personality_score]
                              else
                                [PersonalityTypeRepository.balanced, average_answer.personality_score]
                              end

    @personality_test_response.update!(personality_type_id: personality_type.id, score:)
  end

  private

  def average_answer
    @average_answer ||= Answer.new(introvert_score: average_score)
  end

  def average_score
    answers.inject(0) do |sum, e|
      sum + e.introvert_score
    end / answers.count
  end

  def answers
    @answers ||= @personality_test_response.answers
  end
end
