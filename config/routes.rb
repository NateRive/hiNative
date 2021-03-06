Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :categories
    resources :chats

    root to: "users#index"
  end
  devise_for :users
  mount ActionCable.server => "/cable"
  root "tops#index"
  resources :categories, path: '/ja', only: :index
  resources :chats
  resources :users, except: [:new, :create], path: '/ja/users/profiles'
  resource  :settings, except: [:new, :create], path: 'ja/settings'
  get "teachers/:id" => "teachers#index"
end
