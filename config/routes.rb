Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    get '/page/:page', action: :show, on: :collection
  end
  resources :movies do
    get '/page/:page', action: :index, on: :collection
  end

  root to: 'movies#index', as: 'movies_index'
  get 'about', to:'home#about', as:'home_about'

  resources :movies, only: [:show] do
    resources :ratings, only: [:create]
  end
end
