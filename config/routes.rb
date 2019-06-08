Rails.application.routes.draw do
  devise_for :users
  get 'chat/index'
  root 'chat#index'
  get 'room/:id', to: 'chat#show'
  post 'room/:id', to: 'chat#create'
  mount ActionCable.server => '/cable'
  get '/add', to:'chat#addRoom'
  post '/create', to:'chat#createRoom'
  post '/join', to:'chat#joinRoom'
end
