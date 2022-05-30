Rails.application.routes.draw do

  resources :lists do
    resources :list_items
  end

  root 'lists#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
