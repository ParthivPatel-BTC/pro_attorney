Rails.application.routes.draw do

  # get 'admins/view_users'

  # get 'admins/view_cases'

  # get 'admins/view_case'

  post '/rate' => 'rater#create', :as => 'rate'
 
  resources :user_profiles
  get 'home/index'

	resources :cases do 
    collection do
      get 'doc_upload'
      delete 'doc_delete/:document' =>  'cases#delete_document', as: :document
    end
  end 
 
  get 'users/signin'
  get 'users/after_signin' => 'users#after_signin'
    
  devise_for :users, :controllers => { registrations: "users/registrations",
                                      sessions: "users/sessions",
                                      confirmations: "users/confirmations",
                                      passwords: "users/passwords",
                                      unlocks: "users/unlocks"}
  devise_scope :user do
  root  "users/sessions#new"
  end

  namespace :admins do
    get 'view_advocates'
    get 'view_clients'
    get 'view_cases'
    get 'view_case'
    get 'sorting'
  end

  patch 'admins/update_user/:id' => "admins#update_user", as: :update_user
  patch 'admins/update_case/:id' => "admins#update_case", as: :update_case

 # devise_for :useseers
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
