class AdminsController < ApplicationController
	def view_advocates
		@users=User.joins(:user_profile).order("user_profiles.first_name").where(role_id: 3).paginate(:page => params[:page], :per_page => 5)
	end

	def view_clients
		@users=User.joins(:user_profile).order("user_profiles.first_name").where(role_id: 2).paginate(:page => params[:page], :per_page => 5)
	end

	def view_cases
		@cases=Case.all.paginate(:page => params[:page], :per_page => 5)
	end

	def view_case
	end

  	def update_user
		user=User.find(params[:id])
		user.update!(is_active: !user.is_active)
		if user.role.title == "advocate"
			redirect_to  admins_view_advocates_path 
	  else
			redirect_to  admins_view_clients_path 
	  end
	end
	
	def update_case
		c=Case.find(params[:id])
		c.update!(is_active: !c.is_active)
		redirect_to admins_view_cases_path 
	end
end