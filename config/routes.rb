Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
 
  resources :user_profiles
  get 'home/index'
  #get 'cases/set'
  resources :cases do
    collection do
      get 'doc_upload'
      delete 'doc_delete/:document' =>  'cases#delete_document', as: :document
    end
  end 
 
  #post 'send_purchase_mail/:id' =>'cases#send_purchase_mail',as: :send_purchase_mail

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
end