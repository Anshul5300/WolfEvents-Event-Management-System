Rails.application.routes.draw do
  resources :tickets
  resources :reviews
  resources :events
  get 'events/newDate'
  get 'home/index'
  root 'home#index'
  get 'events/:id', to: 'events#show', defaults: { format: 'json' }
  get 'reviews/by_user_name/:name', to: 'reviews#by_user_name', as: :reviews_by_user_name
  get 'reviews/by_event_name/:name', to: 'reviews#by_event_name', as: :reviews_by_event_name

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
