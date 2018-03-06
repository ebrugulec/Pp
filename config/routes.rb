Rails.application.routes.draw do
  devise_for :users
  # authenticated :user do
  #   root 'messages#index', as: :authenticated_root
  #   resources :messages
  # end
  # root 'home#index'

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  root to: 'chatrooms#index'
  # mount ActionCable.server, at: '/cable'
end
