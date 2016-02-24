class Users::ConfirmationsController < Devise::ConfirmationsController
 layout 'registration_layout'

   def after_confirmation_path_for(resource_name, resource)
       new_user_profile_path
   end
end
