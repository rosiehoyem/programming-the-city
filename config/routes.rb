Rails.application.routes.draw do

  resources :companies
  resources :initiatives
  resources :media
  resources :people
  resources :concepts
  root 'pages#index'

end
