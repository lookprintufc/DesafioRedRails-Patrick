Rails.application.routes.draw do

  devise_for :users,
  controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations",
    confirmations: "users/confirmations",
    omniauth_callbacks: "users/omniauth_callbacks"
  },
    path: "/",
    path_names: { sign_in: 'login',
                  sign_out: 'logout',
                  password: 'secret',
                  unlock: 'unblock',
                  registration: 'inscription',
                  sign_up: 'new' }

  devise_scope :user do
    authenticated :user do
      get 'host' => 'places#new', as: :places
      post 'host' => 'places#create', as: :create_place
      get 'host/edit/:id_place' => 'places#edit', as: :edit_place

      get 'my_hosts' => 'places#my_places', as: :my_places
      resources :places

    end
    unauthenticated :users do
      get 'host/:id_place' => 'places#index', as: :place_index
    end

  end


  root 'start#index'
end
