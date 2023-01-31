Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "questions#index"

  resources :multiple_choice_challenges, only: %w[new create show], shallow: true do
    resources :choices, only: %w[new create]
  end

  resources :match_challenges, only: %w[new create show], shallow: true do
    resources :match_pairs, only: %w[new create], as: :pairs
  end

  post '/position_up', to: 'positions#position_up'
  post '/position_down', to: 'positions#position_down'
end
