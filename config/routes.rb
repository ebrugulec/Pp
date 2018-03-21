Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :admin

  devise_for :users, :controllers => { :invitations => 'devise/invitations' }
  authenticated :user do
    root to: 'chatrooms#index', as: :authenticated_root
    resources :photos
    resources :users, only: [:show]
    resources :chatrooms do
      resource :chatroom_users
      resources :messages
      resources :users, only: [:show]
    end

    resources :direct_messages

    resources :surveys do
      get 'build_question', to: "surveys#build_question", as: :build_question
    end

    resources :conversations do
      resources :messages

      collection do
        get :inbox
        get :all, action: :index
        get :sent
        get :trash
      end
    end
  end

  root 'home#index'
  # mount ActionCable.server, at: '/cable'
end
