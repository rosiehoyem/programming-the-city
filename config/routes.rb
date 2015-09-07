Rails.application.routes.draw do

  resources :people
  resources :concepts
  root 'pages#index'

end
