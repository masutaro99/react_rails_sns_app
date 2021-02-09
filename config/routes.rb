Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, only: []
  # get 'messages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: :index, format: 'json' #=> この行を追加
  resources :posts
  namespace :v1, defaults: { format: :json } do
    resources :login, only: [:create], controller: :sessions
    resources :users, only: [:index, :create]
  end
end
