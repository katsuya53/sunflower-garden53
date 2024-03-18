Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  
  root to: "posts#index"
  resources :posts do
    collection do
      get 'search'
    end
  end
  
  # ユーザーの詳細画面へのルートを追加
  resources :users, only: [:show, :edit, :update, :destroy]
end