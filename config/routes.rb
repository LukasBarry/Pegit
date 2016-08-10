Rails.application.routes.draw do
  get 'meetups/feed'

  get 'profiles/:id' => 'profiles#show', as: :profile
  root 'profiles#index'
  resources :handicaps
  devise_for :users

end
