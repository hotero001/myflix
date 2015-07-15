Myflix::Application.routes.draw do
  root to: 'videos#index'
  resources :videos, only: [:show] do
  	collection do
  	  post :search, to: "videos#search"
  	end
  end
  get 'ui(/:action)', controller: 'ui'
  #The routes below were used prior to Kevin's video search
  get 'home', to: 'videos#index'
  get 'video', to: 'videos#show'
  resources :categories, only: :show
end
