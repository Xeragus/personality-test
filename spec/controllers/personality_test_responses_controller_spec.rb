require 'rails_helper'

RSpec.describe PersonalityTestResponsesController, type: :controller do
  describe "#index" do
    it 'assigns @questions with all questions' do
      questions = create_list(:question, 3, answers: build_list(:answer, 4))
      get :index
      expect(assigns(:questions)).to match_array(questions)
    end
  end

  describe '#create' do
    context 'when result is extrovert personality' do
      let(:score) { 44 }
      let(:questions) { create_list(:question, 2, answers: build_list(:answer, 2, introvert_score: score)) }
      let(:params) { { answers: [questions.first.answers.first.id, questions.second.answers.second.id] } }
      let(:personality_test_response) { double(:personality_test_response) }

      before do
        create(:personality_type, :extrovert)
      end

      it 'generates a personality test response' do
        post :create, params: params

        expect(JSON.parse(response.body)).to eq(
          {
            score_data: {
              personality: PersonalityTypeRepository.extrovert.name,
              score: Answer.new(introvert_score: score).personality_score
            }
          }.deep_stringify_keys
        )
      end
    end
  end
end