Rails.application.routes.draw do
  devise_for :authors, controllers: { registrations: 'authors/registrations' }, path: 'accounts',
                       path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout',
                                     password: 'secret', confirmation: 'verification' }

  resources :books
  get 'assign_tags' => 'books#assign_tags'
  post 'assign_book_tags' => 'books#assign_book_tags'
  delete '/books/:id' => 'books#destroy'
  get '/create_session/:id' => 'books#create_session', as: :create_session

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'books#index'
end
