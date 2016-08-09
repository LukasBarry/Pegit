Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users

end
