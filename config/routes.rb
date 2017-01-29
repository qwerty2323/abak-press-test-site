Rails.application.routes.draw do
  resources :pages
  root to: 'pages#index'
  get '/p/*id', to: 'pages#show', as: :nested_pages
end
