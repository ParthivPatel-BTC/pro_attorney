class AdminsController < ApplicationController
  before_action :set_user,only: [:update_user]
  before_action :set_case,only: [:update_case]

	def view_advocates
		@users = User.joins(:user_profile).order("user_profiles.first_name").where(role_id: Role.find_by(title: 'advocate').id).paginate(:page => params[:page], :per_page => 5)
	end

	def view_clients
		@users = User.joins(:user_profile).order("user_profiles.first_name").where(role_id: Role.find_by(title: 'client').id).paginate(:page => params[:page], :per_page => 5)
	end

	def view_cases
		@cases = Case.order(:case_title).paginate(:page => params[:page], :per_page => 5)
	end

	def view_case
	end

	def update_user
		@user.update!(is_active: !@user.is_active)
		if @user.is_advocate?
			redirect_to  admins_view_advocates_path 
	  else
			redirect_to  admins_view_clients_path 
	  end
	end

	def update_case
		@c.update!(is_active: !@c.is_active)
		redirect_to admins_view_cases_path 
	end

	private
	def set_user
		@user = User.find(params[:id])
	end

	def set_case
		@c = Case.find(params[:id])
	end
end