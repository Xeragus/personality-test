require 'rails_helper'

describe AnswerPresenter do
  let(:subject) { answer.decorate }
  let(:content) { 'A' }
  let(:answer) { build(:answer, content: content, introvert_score: introvert_score) }

  describe "#print_with_personality" do
    context 'when answer is more extrovert' do
      let(:introvert_score) { 40 }

      it 'returns properly presented answer' do
        expect(subject.print_with_personality).to eq("#{content} (#{answer.personality_score}% extrovert)")
      end
    end

    context 'when answer is more introvert' do
      let(:introvert_score) { 60 }

      it 'returns properly presented answer' do
        expect(subject.print_with_personality).to eq("#{content} (#{answer.personality_score}% introvert)")
      end
    end

    context 'when answer is balanced' do
      let(:introvert_score) { 50 }

      it 'returns properly presented answer' do
        expect(subject.print_with_personality).to eq("#{content} (#{answer.personality_score}% balanced)")
      end
    end
  end

end