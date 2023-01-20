class Answer < ApplicationRecord
  include Presentable

  belongs_to :question
  has_many :personality_test_responses_answers, class_name: 'ResponseAnswer'
  has_many :personality_test_responses, through: :personality_test_responses_answers

  validates :content, presence: true

  def personality_score
    PersonalityScoreService.calibrate_score(introvert_score)
  end

  # NOTE: In the future the "introvert score" could be a more complex calculation, hence extraction in methods
  def introvert?
    PersonalityScoreService.introvert?(introvert_score)
  end

  def extrovert?
    PersonalityScoreService.extrovert?(introvert_score)
  end

  def balanced?
    PersonalityScoreService.balanced?(introvert_score)
  end
end
