require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'has many answers' do
    expect(Question.reflect_on_association(:answers).macro).to eq(:has_many)
  end

  context 'when creating question with allowed number of answers' do
    let(:question) { build(:question, answers: build_list(:answer, 5)) }

    it 'doesn\'t raise an error' do
      expect { question.save! }.not_to raise_error(Exception)
    end
  end

  context 'when creating question with 1 answer' do
    let(:question) { build(:question, answers: build_list(:answer, 1)) }

    it 'raises an error' do
      expect { question.save! }.to raise_error(ActiveRecord::RecordInvalid).with_message(
        'Validation failed: Answers minimum of 2 answers per questions required'
      )
    end
  end

  context 'when creating question with 11 answers' do
    let(:question) { build(:question, answers: build_list(:answer, 11)) }

    it 'raises an error' do
      expect { question.save! }.to raise_error(ActiveRecord::RecordInvalid).with_message(
        'Validation failed: Answers maximum of 10 answers per question allowed'
      )
    end
  end

  context 'when creating question with an empty answer' do
    let(:question) { build(:question, answers: [build(:answer, content: 'A'), build(:answer, content: nil)]) }

    it 'raises an error' do
      expect { question.save! }.to raise_error(ActiveRecord::RecordInvalid).with_message(
        'Validation failed: Answers content can\'t be blank, Answers is invalid'
      )
    end
  end
end
