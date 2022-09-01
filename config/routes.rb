Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"

  resources :friends, only: %i[index show new create] do
    get 'friends/:id/confirm', to: 'bookings#confirm', as: :confirm
    resources :bookings, only: %i[new create]
  end
  resources :users, only: [:show]
  resources :bookings, only: [:destroy]

end
