class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :content, presence: true
  validates_associated :answers
  validates :answers, length: {
    minimum: 2, maximum: 10,
    too_short: 'minimum of 2 answers per questions required', too_long: 'maximum of 10 answers per question allowed'
  }

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end
