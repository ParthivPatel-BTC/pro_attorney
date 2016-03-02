class CasesController < ApplicationController
  before_action :set_case, only: [:show,:edit,:update,:destroy,:purchase,:show_purchased]
  protect_from_forgery except: [:hook]
  after_action :hook,only: [:show_purchased]
  skip_before_filter :verify_authenticity_token, :only => [:show_purchased]
  def index
    if params[:search].blank?
      @user_case = Case.all.paginate(page: params[:page], per_page: t("per_page"))
    else
      @user_case = Case.search_by_all(params[:search]).paginate(page: params[:page], per_page: t("per_page"))
    end 
  end

  def show
  end

  def update
    if @user_case.update(case_params)
      if params[:document]
        params[:document].each { |image|
        @user_case.documents.create(doc: image)
        }
        flash[:success] = "Case update succefully"
      end
      redirect_to @user_case
    else
      render :edit 
    end
  end

  def delete_document
    case_id = Document.find(params[:document]).case_id
    Document.destroy(params[:document])
    redirect_to edit_case_path(Case.find(case_id)) 
  end
  
  def edit
    @documents = @case.documents
  end

  def new
    @case = Case.new(user_id: current_user)
    @documents = @case.documents
  end

  def create
    @case = Case.new(case_params.merge({user_id: current_user.id}))
    if @case.save
      if params[:document]
        params[:document].each { |image|
        @case.documents.create(doc: image)
        }
        flash[:success] = "Case created succefully"
        redirect_to cases_path
      end
    else
      flash[:danger] = @case.errors.full_messages
      @documents = @case.documents
      render :new
    end
  end

  def destroy
    if @case.destroy
      @case.documents.destroy
      redirect_to cases_path
    end
  end

  def show_purchased
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
                        transaction_id: params[:invoice])
    end
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