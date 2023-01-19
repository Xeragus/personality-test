class Answer < ApplicationRecord
  include Presentable

  belongs_to :question
  has_many :personality_test_responses_answers, class_name: 'ResponseAnswer'
  has_many :personality_test_responses, through: :personality_test_responses_answers

  validates :content, presence: true

  # NOTE: In the future the "introvert score" could be a more complex calculation, hence extraction in methods
  def introvert?
    introvert_score > 50
  end

  def extrovert?
    introvert_score < 50
  end

  def balanced?
    introvert_score == 50
  end

  def personality_score
    return 100 - introvert_score if extrovert?

    introvert_score
  end
end
