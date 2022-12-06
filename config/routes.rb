Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  resources :categories do 
    resources :tasks 
  end 
  
  # get '/category' => 'category#index', as: 'categories'
  # get '/category/new' => 'category#new', as: 'new_category'
  # post '/category' => 'category#create', as: 'create_category'
  # get '/category/:id/edit' => 'category#edit', as: 'edit_category'
  # put '/category/:id'=> 'category#update'
  # delete '/category/:id' => 'category#delete'
  # get '/category/:id' => 'category#show', as: 'category' 
end
