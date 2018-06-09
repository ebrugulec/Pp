Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :admin
  devise_for :users, :controllers => { :invitations => 'devise/invitations' }
  authenticated :user do
    root to: 'chatrooms#index'
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

    # post 'create_conversation', to: 'conversations#create'
    resources :conversations do
      resources :messages
      get 'sil', to: 'conversations#trash_sil'

      collection do
        get :inbox
        get :all, action: :index
        get :sent
        post :create, as: "new_con"
        # post :trash, as: "trash"
      end
    end
  end

  devise_scope :user do
    get "/" => "devise/sessions#new"
  end

  # mount ActionCable.server, at: '/cable'
end
