Rails.application.routes.draw do
  root to: "pages#show", id: 'home'

  devise_for :users, controllers: {registrations: "registrations", sessions: "sessions"}
  resources :collections do
    member do
      post :sort
    end
  end
  resources :resource_collections, only: [:update]
  resources :resources do
    member do
      post :collect_one
    end
  end
  resources :users, only: [:index, :show]
end
