Rails.application.routes.draw do
  get 'meetups/feed'

  get 'profiles/show'
  root 'profiles#index'

  devise_for :users

end
