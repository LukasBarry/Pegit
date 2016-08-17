Rails.application.routes.draw do

  get 'profiles/:id' => 'profiles#show', as: :profile
  get 'meetups/:id' => 'meetups#show', as: :meetup

  root 'handicaps#index'
  get 'feed' => 'meetups#feed'
  resources :meetups do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resource :partner, except: [:show]
  end

    resources :handicaps
    devise_for :users

end
