Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
    devise_scope :user do
      post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    end
  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'
  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
end
