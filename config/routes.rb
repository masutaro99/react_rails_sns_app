Rails.application.routes.draw do
  # get 'messages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: :index, format: 'json' #=> この行を追加
  resources :posts
end
