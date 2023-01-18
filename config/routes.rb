Rails.application.routes.draw do
  resources :questions
  resources :answers, only: [], param: :index do
    member do
      delete '(:id)' => 'answers#destroy', as: ''
      post '/' => 'answers#create'
    end
  end
  # root "articles#index"
end
