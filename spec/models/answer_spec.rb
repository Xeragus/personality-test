require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) { build(:answer, content: 'A', introvert_score: introvert_score) }

  it 'belongs to question' do
    expect(Answer.reflect_on_association(:question).macro).to eq(:belongs_to)
  end

  context 'when creating answer without question and content' do
    it 'raises "ActiveRecord::RecordInvalid Validation failed: Question must exist, Content can\'t be blank"' do
      expect { Answer.create! }.to raise_error(ActiveRecord::RecordInvalid).with_message(
        "Validation failed: Question must exist, Content can't be blank"
      )
    end
  end

  context 'when creating answer without question' do
    it 'raises "ActiveRecord::RecordInvalid Validation failed: Question must exist, Content can\'t be blank"' do
      expect { Answer.create!(content: 'A') }.to raise_error(ActiveRecord::RecordInvalid).with_message(
        "Validation failed: Question must exist"
      )
    end
  end

  context 'when creating answer without content' do
    let(:question) { build(:question, answers: build_list(:answer, 2)) }

    before { question.save }

    it 'raises "ActiveRecord::RecordInvalid Validation failed: Content can\'t be blank"' do
      expect { Answer.create!(question: question) }.to raise_error(ActiveRecord::RecordInvalid).with_message(
        'Validation failed: Content can\'t be blank'
      )
    end
  end

  describe 'introvert?' do
    context 'when introvert value is greater than 50' do
      let(:introvert_score) { 60 }

      it 'returns true' do
        expect(answer.introvert?).to be true
      end
    end

    context 'when introvert value is less than 50' do
      let(:introvert_score) { 40 }

      it 'returns true' do
        expect(answer.introvert?).to be false
      end
    end

    context 'when introvert value is equal to 50' do
      let(:introvert_score) { 50 }

      it 'returns true' do
        expect(answer.introvert?).to be false
      end
    end
  end

  describe 'extrovert?' do
    context 'when introvert value is greater than 50' do
      let(:introvert_score) { 60 }

      it 'returns true' do
        expect(answer.extrovert?).to be false
      end
    end

    context 'when introvert value is less than 50' do
      let(:introvert_score) { 40 }

      it 'returns true' do
        expect(answer.extrovert?).to be true
      end
    end

    context 'when introvert value is equal to 50' do
      let(:introvert_score) { 50 }

      it 'returns true' do
        expect(answer.extrovert?).to be false
      end
    end
  end

  describe 'balanced?' do
    context 'when introvert value is greater than 50' do
      let(:introvert_score) { 60 }

      it 'returns true' do
        expect(answer.balanced?).to be false
      end
    end

    context 'when introvert value is less than 50' do
      let(:introvert_score) { 40 }

      it 'returns true' do
        expect(answer.balanced?).to be false
      end
    end

    context 'when introvert value is equal to 50' do
      let(:introvert_score) { 50 }

      it 'returns true' do
        expect(answer.balanced?).to be true
      end
    end
  end

  describe '#personality_score' do
    context 'when score is extrovert' do
      let(:introvert_score) { 40 }

      it 'returns 100 deducted by the introvert score' do
        expect(answer.personality_score).to eq(100 - introvert_score)
      end
    end

    context 'when score is introvert' do
      let(:introvert_score) { 60 }

      it 'returns the introvert score' do
        expect(answer.personality_score).to eq(introvert_score)
      end
    end

    context 'when score is balanced' do
      let(:introvert_score) { 50 }

      it 'returns the introvert score' do
        expect(answer.personality_score).to eq(introvert_score)
      end
    end
  end
end
