class CasesController < ApplicationController
  before_action :set_case, only: [:show,:edit,:update,:destroy,:purchase,:show_purchased]
  protect_from_forgery except: [:hook]
  before_action :hook,only: [:show_purchased]
  skip_before_filter :verify_authenticity_token, :only => [:show_purchased]
  def index
    if current_user.is_client?
     if params[:search].blank?
      @user_case = Case.case_type_search(params[:case_type]).paginate(page: params[:page], per_page: t("per_page")).where(user_id:current_user.id)
     else
      @user_case = Case.case_type_search(params[:case_type]).search_by_all(params[:search]).paginate(page: params[:page], per_page: t("per_page")).where(user_id:current_user.id)
     end 
    else
      if params[:search].blank?
      @user_case=Case.case_type_search(params[:case_type]).paginate(page: params[:page], per_page: t("per_page")).where(status: "open")
     else
      @user_case =Case.case_type_search(params[:case_type]).search_by_all(params[:search]).paginate(page: params[:page], per_page: t("per_page")).where(status: "open")
     end 
    end
    respond_to do |format|
    format.js
    format.html
    end

  end

  def client_details
  end
  
  def show
  end
  
  def update
    if @user_case.update(case_params)
      if params[:document]
        params[:document].each { |image|
        @user_case.documents.create(doc: image)
        }
        
      end
      redirect_to @user_case
      flash[:success] = "Case updated succefully"
    else
      render :edit
      flash[:danger] = @user_case.errors.full_messages
    end
  end

  def send_purchase_mail
    client=Case.find(params[:item_number]).user
    advocate=User.find(current_user.id)
    @cu=current_user.id
    puts "#{current_user.id}"
    UserMailer.purchase(client,advocate,current_user).deliver_now
  end



  def delete_document
    case_id = Document.find(params[:document]).case_id
    Document.destroy(params[:document])
    redirect_to edit_case_path(Case.find(case_id)) 
  end
  
  def edit
    @documents = @user_case.documents
  end

  def new
    if(!current_user.user_profile.present?)
      flash[:danger] = "Create Profile Before creating case"
      redirect_to  new_user_profile_path 
    end
    @user_case = Case.new(user_id: current_user.id)
    @documents = @user_case.documents
  end

  def create
    @user_case = Case.new(case_params.merge({user_id: current_user.id}))
    if @user_case.save  
      if params[:document]
        params[:document].each { |image|
        @user_case.documents.create(doc: image)
        }
        flash[:success] = "Case created successfully"
        redirect_to cases_path
      else
         flash[:success] = "Case created successfully without documents"
         redirect_to cases_path
      end
    else
      flash[:danger] = @user_case.errors.full_messages
      @documents = @user_case.documents
      render :new
    end
  end

  def destroy
    if @user_case.destroy
      @user_case.documents.destroy
      redirect_to cases_path
      flash[:success] = "Case deleted successfully"
    end
  end

  def show_purchased
    flash[:success] = "Case purchased successfully"
    render 'show'
  end

  def purchase
    redirect_to @user_case.paypal_url(user_case_cases_path(@user_case))
  end

  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
         Payment.create(case_id: params[:item_number],
                        user_id: current_user.id,
                        notification_params: params,
                        status: status,
                        transaction_id: params[:txt_id],
                          purchased_at: Time.now+0530)
         send_purchase_mail
         Case.find(params[:item_number]).update(status: "closed")
    end
  end


  def purchase_case
  @payments =current_user.payments.paginate(page: params[:page], per_page: t("per_page"))
   # @user_case=Payment.joins(:cases).where(user) 
  end

  
  def doc_upload
  end

  private
  
  def set_case
    @user_case = Case.find(params[:id])
  end

  def case_params
    params.require(:case).permit(:user_id, :case_type_id, :case_title, :case_detail, :location,:status)
  end

  def doc_params
    params.require(:document).permit(:doc_file_name, :doc_content_type, :doc_file_size, :doc_updated_at)
  end
end