Rails.application.routes.draw do
  root to: "pages#show", id: 'home'

  devise_for :users, controllers: {registrations: "registrations", sessions: "sessions"}
  resources :collections
  resources :resources
end
