Rails.application.routes.draw do
  devise_for :users

  resources :teams do
    resources :divisions, except: [:index], shallow: true do
      resources :members, except: [:index], shallow: true
    end
  end

  resources :tags, except: [:show]

  root to: 'home#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
