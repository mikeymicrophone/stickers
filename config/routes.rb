Stickers::Application.routes.draw do
  resources :tier_houses

  resources :memberships

  resources :sub_clubs do
    resources :members
    resources :tiers
    resources :endeavors
  end

  resources :tierings do
    collection do
      post :sort
    end
  end

  resources :tiers do
    member do
      post :copy
    end
    resources :endeavors
  end

  resources :invitees do
    member do
      get :confirmation
    end
  end

  resources :invites

  resources :details do
    member do
      get :download_payload_for
    end
  end

  resources :scores do
    resources :details
  end

  resources :days

  resources :endeavors

  resources :goals do
    resources :members
  end

  devise_for :members
  
  resources :members, :only => [:index, :show] do
    resources :goals
    resources :scores
    resources :tiers
    resources :endeavors
  end
  
  root :to => 'goals#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
