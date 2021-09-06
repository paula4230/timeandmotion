Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  
  #PATCH	/projects/:project_id/phases/:id(.:format)	phases#update_start
  # resources :categories do
    resources :projects, except: [:update] do
      resources :phases, except: [:update]
    end
  # end

  patch '/projects/:project_id/phases/:id' => 'phases#update_end', :as => 'update_end'
  patch '/projects/:project_id/phases/:id' => 'phases#update_start', :as => 'update_start'
  patch '/projects/:project_id' => 'projects#finalize_phases', :as => 'finalize_phases'

  get '/pages/projects', to: 'pages#index' 
  get '/pages/projects/:project_id/phases', to: 'project_allphases#index' , :as => 'project_allphases'

  get '/query_project' => 'pages#query_project'
  get '/query_phase' => 'pages#query_phase'
  
end
