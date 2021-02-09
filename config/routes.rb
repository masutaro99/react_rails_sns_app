Rails.application.routes.draw do
  devise_for :users, only: []
  # get 'messages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: :index, format: 'json' #=> この行を追加
  resources :posts
  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resource :users, only: [:create]
  end
end
