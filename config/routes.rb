Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "questions#index"

  get 'search', to: "questions#search"

  post 'comments/create' => "comments#create"

  post 'answer_votes/:id/vote' => 'votes#create', as: :answer_vote
   
  delete 'answer_votes/:id/vote' => 'votes#destroy', as: :answer_vote_destroy
 
  resources :questions, except: [:update, :edit, :destroy] do
  	resources :answers, only: [:create]
  	resources :comments, only: [:create]
  	resources :votes, only: [:create, :destroy]
  end


end
