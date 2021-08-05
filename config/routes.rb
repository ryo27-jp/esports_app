Rails.application.routes.draw do
  devise_for :users

  resources :teams, only: %i[index show] do
    collection do
      get 'search'
    end
    resources :divisions, only: [:show], shallow: true do
      resources :members, only: [:show], shallow: true
    end
  end
  namespace :admin do
    resources :teams, only: %i[new edit create update destroy] do
      resources :divisions, only: %i[new edit create update destroy], shallow: true do
        resources :members, only: %i[new edit create update destroy], shallow: true
      end
    end
    resources :tags, only: %i[new edit create update destroy]
  end

  resources :tags, only: %i[index show] do
    collection do
      get 'search'
    end
  end

  root to: 'home#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
