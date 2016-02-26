class Users::ConfirmationsController < Devise::ConfirmationsController
 layout 'registration_layout'
 	 before_action :authenticate_user!
   def after_confirmation_path_for(resource_name, resource)
      root_path
   end
end
