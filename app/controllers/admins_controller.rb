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
		@case1 = Case.order(:case_title).paginate(:page => params[:page], :per_page => 5)
	end

	def view_case
	end

	def update_user
		@user.update(is_active: !@user.is_active)
			if @user.is_advocate? 
				@users = User.joins(:user_profile).order("user_profiles.first_name").where(role_id: Role.find_by(title: 'advocate').id).paginate(:page => params[:page], :per_page => 5)
			else
				@users = User.joins(:user_profile).order("user_profiles.first_name").where(role_id: Role.find_by(title: 'client').id).paginate(:page => params[:page], :per_page => 5)
			end
		respond_to do |format|
		format.js
		end
	end

	def update_case
		@case1.update(is_active: !@case1.is_active)
		@case1 = Case.order(:case_title).paginate(:page => params[:page], :per_page => 5)
		respond_to do |format|
		format.js
		end
	end

	def sorting
		@case1 = Case.order(:case_title).paginate(:page => params[:page], :per_page => 5)
		respond_to do |format|
		format.js
		end
	end

	private
	def set_user
		@user = User.find(params[:id])
	end

	def set_case
		@case1 = Case.find(params[:id])
	end
end