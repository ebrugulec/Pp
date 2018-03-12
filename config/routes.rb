Rails.application.routes.draw do
  post 'direct_message/create/:id', to: 'direct_messages#create', as: 'direct_message'

  get 'direct_message/index/:id', to: 'direct_messages#index', as: 'create_direct'
  post 'direct_message/create_chatroom/:id', to: 'direct_messages#create_chatroom', as: 'create_chatroom'

  devise_for :users, :controllers => { :invitations => 'devise/invitations' }
  authenticated :user do
    get '/users', to: "users#index", as: "all_users"
    resources :chatrooms do
      resource :chatroom_users
      resources :messages
      resources :users
    end
  end

    authenticated :user do
      resources :conversations do
        resources :messages

        collection do
          get :inbox
          get :all, action: :index
          get :sent
          get :trash
        end
      end


    root to: 'chatrooms#index', as: :authenticated_root
  end
  root 'home#index'
  # mount ActionCable.server, at: '/cable'
end
