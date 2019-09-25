Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "questions#index"

  resources :questions do
  	resources :answers, only: [:create]
  	resources :comments, only: [:create]
  	resources :votes, only: [:create, :destroy]
  end

  resources :answers do
  	resources :comments, only: [:create]
  	resources :votes, only: [:create, :destroy]
  	
  end
end
