class AnswersController < ApplicationController
  before_action :setup_question
  before_action :find_answer, only: :destroy

  def new
  end

  def destroy
    @answer&.destroy
  end

  private

  def setup_question
    @question = Question.new(answers: [Answer.new, Answer.new])
  end

  def find_answer
    @answer = Answer.find_by(id: params['id'])
  end
end
