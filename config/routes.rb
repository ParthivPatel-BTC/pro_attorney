Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
 
  resources :user_profiles
  get 'home/index'

	resources :cases do 
    collection do
      get 'case_purchase_paypal/:id' =>'cases#case_purchase_paypal',as: :id
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
    root  "users/registrations#new"
  end
end
