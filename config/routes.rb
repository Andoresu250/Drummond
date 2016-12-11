Rails.application.routes.draw do
  resources :reports
  #resources :shots
  #resources :tasks
  #resources :observations
  resources :groups
  #resources :group_ids
  resources :workers
  resources :equipment
  resources :vehicles
  devise_for :users
  #resources :dashboard

  resources :users_admin, :controller => 'users'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #devise_scope :user do
  #  root to: "devise/sessions#new"
  #end

  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  root to: "reports#index"

  put "/groups/:id/set_current", to: "groups#set_current"
  put "/workers/:id/fire", to: "workers#fire"
  put "/workers/:id/contract", to: "workers#contract"
  
  put "/equipment/:id/up", to: "equipment#up"
  put "/equipment/:id/down", to: "equipment#down"
  
   put "/vehicles/:id/up", to: "vehicles#up"
   put "/vehicles/:id/down", to: "vehicles#down"

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
