Rails.application.routes.draw do

  resources :sprintdiaries
  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users

  get  '/users/:id/editpassword(.:format)'     => 'users#edit_password',  :as => 'edit_password'

  # resources :projects
  
  resources :sprints, :only => [:show, :edit, :update, :destroy]

  get  '/projects/:project_id/sprints(.:format)'     => 'sprints#index',  :as => 'sprints'
  get  '/projects/:project_id/sprints/new(.:format)' => 'sprints#new',    :as => 'new_project_sprint'
  post '/projects/:project_id/sprints(.:format)'     => 'sprints#create', :as => 'project_sprints'

  resources :scrum_members, :only => [:show, :edit, :update, :destroy]

  get  '/projects/:project_id/scrum_members(.:format)'     => 'scrum_members#index',  :as => 'scrum_members'
  get  '/projects/:project_id/scrum_members/new(.:format)' => 'scrum_members#new',    :as => 'new_project_scrum_members'
  post '/projects/:project_id/scrum_members(.:format)'     => 'scrum_members#create', :as => 'project_scrum_members'

  resources :backlog_items, :only => [:update, :destroy]

  get  '/projects/:project_id/pbl(.:format)'     => 'backlog_items#index_pbl', :as => 'pbl'
  get  '/projects/:project_id/pbl/new(.:format)' => 'backlog_items#new_pbl',   :as => 'new_pbl'
  get  '/pbl/:id(.:format)'                      => 'backlog_items#show_pbl',  :as => 'show_pbl'
  get  '/pbl/:id/edit(.:format)'                 => 'backlog_items#edit_pbl',  :as => 'edit_pbl' 
  
  get  '/sprints/:sprint_id/sbl(.:format)'     => 'backlog_items#index_sbl', :as => 'sbl'
  get  '/backlog_items/:backlog_item_id/sbl/new(.:format)' => 'backlog_items#new_sbl',   :as => 'new_sbl'
  get  '/sbl/:id(.:format)'                      => 'backlog_items#show_sbl',  :as => 'show_sbl'
  get  '/sbl/:id/edit(.:format)'                 => 'backlog_items#edit_sbl',  :as => 'edit_sbl'

  post '/projects/:project_id/backlog_items(.:format)'  => 'backlog_items#create', :as => 'project_backlog_items'

  resources :alpha_framework_defs, shallow: true do
    resources :alpha_alpha_defs, shallow: true do
      resources :alpha_state_defs, shallow: true do
        resources :alpha_item_defs, shallow: true
      end
    end
  end
  
  resources :projects, shallow: true do
    #resource :alpha_framework, shallow: true do
      resources :alpha_alphas, shallow: true, only: [ :index, :show ] do
        resources :alpha_states, shallow: true, only: [ :index, :show ] do
          resources :alpha_items, shallow: true, only: [ :index, :show ] do
            resource :alpha_evidence, shallow: true, only: [ :show, :edit, :update ] 
          end
        end
      end
    #end
  end

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
