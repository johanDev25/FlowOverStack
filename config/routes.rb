Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "questions#index"

  get 'search', to: "questions#search"

  post 'comments/create' => "comments#create"
 
  resources :questions do
  	resources :answers, only: [:create]
  	resources :comments, only: [:create]
  end


end
