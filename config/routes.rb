Rails.application.routes.draw do
  resources :chatrooms

  # authenticated :user do
  #   root 'messages#index', as: :authenticated_root
  #   resources :messages
  # end
  # root 'home#index'

  resources :chatrooms do
    resource :chatroom_users
  end

  root to: 'chatrooms#index'
  devise_for :users
  resource  :session
  # mount ActionCable.server, at: '/cable'
end
