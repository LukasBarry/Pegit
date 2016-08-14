Rails.application.routes.draw do
  get 'profiles/:id' => 'profiles#show', as: :profile
  root 'handicaps#index'
  get 'feed' => 'meetups#feed'
  resources :meetups do
    resource :partner, except: [:show]
  end
  resources :handicaps
  devise_for :users

end
