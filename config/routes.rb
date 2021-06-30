Rails.application.routes.draw do
  devise_for :users

  resources :teams do
    resources :divisions, except: [:index], shallow: true
  end

  root to: 'home#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
