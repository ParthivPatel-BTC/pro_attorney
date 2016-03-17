class AdminsController < ApplicationController
  before_action :set_user,only: [:update_user]
  before_action :set_case,only: [:update_case]

	def view_advocates
		@users = User.where(role_id: Role.find_by(title: 'advocate').id).order(:email).paginate(:page => params[:page], :per_page => t("per_page"))
	end

	def view_clients
		@users = User.where(role_id: Role.find_by(title: 'client').id).order(:email).paginate(:page => params[:page], :per_page => t("per_page"))
	end

	def view_cases
		if (params[:status]==nil)
			@user_case = Case.order(:case_title).paginate(:page => params[:page], :per_page => t("per_page"))
			@tab = "all"
		else
			@user_case = Case.where(status: params[:status]).order(:case_title).paginate(:page => params[:page], :per_page => t("per_page"))
			@tab=params[:status]

		end
     
  
	end

	def view_case
	end

	def update_user
		@user.update_attribute(:is_active, !@user.is_active)
			if @user.is_advocate? 
				@users = User.joins(:user_profile).order("user_profiles.first_name").where(role_id: Role.find_by(title: 'advocate').id).paginate(:page => params[:page], :per_page => t("per_page"))
			else
				@users = User.joins(:user_profile).order("user_profiles.first_name").where(role_id: Role.find_by(title: 'client').id).paginate(:page => params[:page], :per_page => t("per_page"))
			end
		respond_to do |format|
		format.js
		end
	end

	def update_case
		@user_case.update_attribute(:is_active, !@user_case.is_active)
		@user_case = Case.order(:case_title).paginate(:page => params[:page], :per_page => t("per_page"))
		respond_to do |format|
		format.js
		end
	end

	def sorting
		@user_case = Case.joins(:case_type).joins(:user_profile).order("#{params[:col]} #{params[:order]}").paginate(:page => params[:page], :per_page => t("per_page"))
		respond_to do |format|
		format.js
		end
	end

	def user_sorting
		@users = User.joins(:user_profile).where(role_id: Role.find_by(title: "#{params[:role]}")).order("#{params[:col]} #{params[:order]}").paginate(:page => params[:page], :per_page => t("per_page"))
		respond_to do |format|
		format.js
		end
	end

	def user_log
		@users=User.where("role_id != '1'");
	end

   def user_payment
   	  @payment=Payment.all
   end

   def print_pdf
   
   	respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'admins_user_payment_path',
               template: admins_user_payment_path,
               dpi: '96',
               :show_as_html=> params[:debug].present?,
               disable_internal_links: true, disable_external_links: true,
               :print_media_type => false, :no_background => false
        return
      end
    end
     end


	private
	def set_user
		@user = User.find(params[:id])
	end

	def set_case
		@user_case = Case.find(params[:id])
	end
end