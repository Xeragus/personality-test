class PersonalityTestResponsesController < ApplicationController
  def index
    @questions = Question.all
  end

  def create
    personality_test_response = PersonalityTestGeneratorService.generate!(params)
    PersonalityScoreService.new(personality_test_response).calculate!

    render json: {
      score_data: {
        personality: personality_test_response.personality_type.name,
        score: personality_test_response.score
      }
    }
  end
end
