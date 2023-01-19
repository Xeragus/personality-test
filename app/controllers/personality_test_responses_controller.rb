class PersonalityTestResponsesController < ApplicationController
  def index
    @questions = Question.all
  end

  def create
    sleep(5)

    personality_test_response = PersonalityTestResponse.create!
    params['answers'].each do |answer_id|
      ResponseAnswer.create!(personality_test_response: personality_test_response, answer: Answer.find(answer_id))
    end

    render json: {
      message: 'This is a message from controlelr'
    }
  end
end
