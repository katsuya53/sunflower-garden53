Rails.application.routes.draw do

  devise_for :users # ユーザーモデル名に基づいて修正

  root to: "posts#index"
  resources :posts do
    resources :comments
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :comments

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

end
