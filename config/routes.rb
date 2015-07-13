Myflix::Application.routes.draw do
  root to: 'ui#index'
  get 'ui(/:action)', controller: 'ui'
  get 'home', to: 'videos#index'
  get 'video', to: 'videos#show'
  resources :categories, only: :show
end
