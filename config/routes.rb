Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  
  resources :categories do
    resources :projects do
      resources :phases
    end
  end

  post '/categories/:id', to: 'categories#update'
  
end
