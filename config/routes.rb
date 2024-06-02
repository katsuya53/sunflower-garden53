Rails.application.routes.draw do
  get 'blogs/index'

  devise_for :users # ユーザーモデル名に基づいて修正

  root to: "posts#index"
  resources :posts do
    resources :comments
    collection do
      get 'search'
      get 'search_tag'
    end
    resource :likes, only: [:create, :destroy]
  end

  resources :users do
    resource :follows, only: [:create, :destroy]
  end

  resources :comments

  resources :blogs

  resources :records

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  get "login", to: "devise/sessions#new" # ログインページのルートを手動で追加

  namespace :public do
    resources :contacts, only: [:new, :create] do
      collection do
        post 'confirm'
        post 'back'
        get 'done'
      end
    end
  end

  resources :flowers, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :import
      get :import # GETリクエスト用のルートを追加
    end
  end
  get '/favicon.ico', to: 'application#favicon'

  get 'weather/show', to: 'weather#show'

end
