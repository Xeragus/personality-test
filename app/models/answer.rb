class Answer < ApplicationRecord
  include Presentable

  belongs_to :question
  has_many :personality_test_responses_answers, class_name: 'ResponseAnswer'
  has_many :personality_test_responses, through: :personality_test_responses_answers

  validates :content, presence: true

  def personality_score
    # 40% introvert means 60% extrovert
    return 100 - introvert_score if introvert_score < 50

    introvert_score
  end

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
end
