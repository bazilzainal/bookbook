Rails.application.routes.draw do
  resources :book_availabilities
  resources :reading_lists
  resources :books
  devise_for :users
  get 'users/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/search', to: 'search#new'
  post '/search', to: 'search#result'
  get '/search/:bid', to: 'search#show'
  get '/search/update/:id', to: 'book_availabilities#update'


end
