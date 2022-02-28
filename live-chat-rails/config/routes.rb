Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }

  resources :messages, only: ['index'] do
    member do
      # messages/:id/likes
      resources :likes, only: ['create']
    end
  end

  # /likes/:id
  resources :likes, only: ['destroy']
end
