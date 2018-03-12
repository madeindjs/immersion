Rails.application.routes.draw do
  resources :newsletters
  get "newsletters/:id/send" => "newsletters#send_emails", as: 'send_newsletter'
  resources :newsletter_subscriptions, only: [:create]
  get "unsubscribe/:hash" => "newsletter_subscriptions#unsubscribe", as: 'unsubscribe'
  resources :messages
  resources :reservations, only: [:index, :show, :create, :destroy]
  # sugar URL
  get "products/:id/reservation" => "reservations#new", as: 'new_reservation'

  resources :categories
  resources :products
  get 'pages/legal'

  get 'pages/about'

  resources :users

  get "home" => "pages#home"
  get "legal" => "pages#legal"
  get "contact" => "pages#contact"
  get "about" => "pages#about"

  resources :users
  resources :user_sessions, only: [:create, :destroy]
  get 'signout', to: 'user_sessions#destroy'
  get 'signin', to: 'user_sessions#new'
  get "signup" => "users#new"
  get "confirm_email/:token" => "users#confirm_email", as: 'confirm_email'

  root 'pages#home'
end
