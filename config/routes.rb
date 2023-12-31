Rails.application.routes.draw do
  resources :contacts
  resources :pics
  resources :feeds
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :blogs
  resources :favorites, only: [:create, :destroy] 
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
