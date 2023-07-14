# == Route Map
#

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations",
                                    sessions: "users/sessions",
                                    passwords: "users/passwords", 
                                    devise_authy: "users/deviseauthycustoms",
                                    confirmations: "users/confirmations",
                                    unlocks: "users/unlocks" 
                                  },
                                   path: 'accounts', path_names: { sign_in: 'login',
                                                                   sign_up: 'register',
                                                                   sign_out: 'logout',
                                                                   password: 'secret',
                                                                   confirmation: 'verification'
                                                                  }

  resources :books
  get 'assign_tags' => 'books#assign_tags'
  post 'assign_book_tags' => 'books#assign_book_tags'
  delete '/books/:id' => 'books#destroy'
  get '/create_session/:id', to: 'books#create_session', as: :create_session

  get '/:id/process_book_payment', to: 'books#process_book_payment', as: :process_book_payment
  get '/thanks', to: 'books#thanks', as: 'thanks'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'books#index'
end
