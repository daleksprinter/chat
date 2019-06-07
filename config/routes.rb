Rails.application.routes.draw do
  devise_for :users
  get 'chat/index'
  root 'chat#index'
  get 'room/:id', to: 'chat#show'
end
