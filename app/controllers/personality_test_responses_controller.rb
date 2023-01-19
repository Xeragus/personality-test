class PersonalityTestResponsesController < ApplicationController
  def index
    @questions = Question.all
    @personality_test_response = PersonalityTestResponse.new
  end
end
