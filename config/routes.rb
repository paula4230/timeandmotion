Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  
  #PATCH	/projects/:project_id/phases/:id(.:format)	phases#update_start
  # resources :categories do
    resources :projects do
      resources :phases, except: [:update]
    end
  # end

  patch '/projects/:project_id/phases/:id' => 'phases#update_start', :as => 'update_start'
  patch '/projects/:project_id/phases/:id' => 'phases#update_end', :as => 'update_end'
  
end
