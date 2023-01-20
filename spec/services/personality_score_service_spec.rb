require 'rails_helper'

describe PersonalityScoreService do
  describe '.calculate!' do
    let!(:introvert_personality_type) { create(:personality_type, :introvert) }
    let!(:extrovert_personality_type) { create(:personality_type, :extrovert) }
    let!(:balanced_personality_type) { create(:personality_type, :balanced) }

    context 'when personality test response contains answers which in average tend towards introversion' do
      let(:question) do
        build(:question, answers: [
          build(:answer, introvert_score: 70),
          build(:answer, introvert_score: 90),
          build(:answer, introvert_score: 20)
        ])
      end
      let!(:personality_test_response) { create(:personality_test_response, answers: question.answers, score: nil) }

      it 'classifies the personality test response\'s as introvert' do
        expect do
          described_class.new(personality_test_response).calculate!
          personality_test_response.reload
        end.to change(personality_test_response, :score).to(60)
           .and change(personality_test_response, :personality_type).to(introvert_personality_type)
      end
    end

    context 'when personality test response contains answers which in average tend towards extroversion' do
      let(:question) do
        build(:question, answers: [
          build(:answer, introvert_score: 20),
          build(:answer, introvert_score: 40),
          build(:answer, introvert_score: 60)
        ])
      end
      let!(:personality_test_response) { create(:personality_test_response, answers: question.answers, score: nil) }

      it 'classifies the personality test response\'s as extrovert' do
        expect do
          described_class.new(personality_test_response).calculate!
          personality_test_response.reload
        end.to change(personality_test_response, :score).to(60)
           .and change(personality_test_response, :personality_type).to(extrovert_personality_type)
      end
    end

    context 'when personality test response contains answers which in average are balanced' do
      let(:question) do
        build(:question, answers: [
          build(:answer, introvert_score: 20),
          build(:answer, introvert_score: 80),
          build(:answer, introvert_score: 50)
        ])
      end
      let!(:personality_test_response) { create(:personality_test_response, answers: question.answers, score: nil) }

      it 'classifies the personality test response\'s as balanced' do
        expect do
          described_class.new(personality_test_response).calculate!
          personality_test_response.reload
        end.to change(personality_test_response, :score).to(50)
           .and change(personality_test_response, :personality_type).to(balanced_personality_type)
      end
    end
  end
end
