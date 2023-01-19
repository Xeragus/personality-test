Rails.application.routes.draw do
  root 'personality_test_responses#index'

  resources :questions
  resources :answers, only: [], param: :index do
    member do
      delete '(:id)' => 'answers#destroy', as: ''
      post '/' => 'answers#create'
    end
  end
  resources :personality_test_responses, only: [:create]
end
