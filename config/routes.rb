Rails.application.routes.draw do
  get 'profiles/:id' => 'profiles#show', as: :profile
  root 'profiles#index'
  get 'meetups/feed' => 'meetups#feed'
  resources :handicaps
  devise_for :users

end
