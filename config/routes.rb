Rails.application.routes.draw do

  get 'home/index'

  post '/rate' => 'rater#create', :as => 'rate'
 
  resources :user_profiles

  #get 'cases/set'
	resources :cases do
    collection do
    get 'purchase/:id' => 'cases#purchase',as: :case
    post "/:id" => "cases#show_purchased", as: :user_case
    post "/hook" => "cases#hook"
    get 'doc_upload'
    get 'client_details' => 'cases#client_details'
    delete 'doc_delete/:document' =>  'cases#delete_document', as: :document
    get 'purchase_case'
    get 'bookmark_case'
    put :favorite
    end
  end 
 
  post 'send_purchase_mail/:id' =>'cases#send_purchase_mail',as: :send_purchase_mail

 
  get 'users/signin'
  get 'users/index' 
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
    get 'user_sorting'
    get 'user_log'
    get 'user_payment'
  end

  patch 'admins/update_user/:id' => "admins#update_user", as: :update_user
  patch 'admins/update_case/:id' => "admins#update_case", as: :update_case

end
