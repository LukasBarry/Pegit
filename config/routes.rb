Rails.application.routes.draw do

  resources :meetups do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resource :partner, except: [:show]
  end
  resources :handicaps
  devise_for :users

  root 'handicaps#index'

  get 'profiles/:id' => 'profiles#show', as: :profile
  get 'feed' => 'meetups#feed'
  
end
