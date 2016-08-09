Rails.application.routes.draw do
  get 'profiles/show'
  root 'profiles#index'

  devise_for :users

end
