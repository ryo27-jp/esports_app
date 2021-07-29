Rails.application.routes.draw do
  devise_for :users

  resources :teams, only: %i[index show] do
    collection do
      get 'search'
    end
    resources :divisions, except: [:index], shallow: true do
      resources :members, except: [:index], shallow: true
    end
  end
  namespace :admin do
    resources :teams, only: %i[new edit create update destroy]
  end

  resources :tags, except: [:show] do
    collection do
      get 'search'
    end
  end

  root to: 'home#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
