Rails.application.routes.draw do
  devise_for :users

  resources :teams
  root to: 'home#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
