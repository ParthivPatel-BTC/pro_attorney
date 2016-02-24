class CasesController < ApplicationController
  before_action :set_case, only: [:show,:edit,:update,:destroy,:case_purchase_paypal,:paypal_show]
 #before_action :authenticate_user!
protect_from_forgery except: [:hook,:case_purchase_paypal]

  def index
    @cases=Case.all
  end

  def show
  end
  
  def test
    unless params[:item_number] == nil
    status = params[:payment_status]
    puts ">>>>>>>>>>>>>>>>>>#{status}"
    puts ">>>>>>>>>>>>>>>>>>#{current_user}"

    if status == "Completed"
      puts ">>>>>>>>>>>>>>>>>#{params[:item_number]}"
      Payment.create(case_id: params[:item_number],notification_params: params[:invoice], status: status,transaction_id: params[:txn_id], purchased_at: Time.now,user_id: current_user.id)
    end 
    end
  end


  def update
    if @case.update(case_params)
     redirect_to @case
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
    @case = Case.new(client_id: current_user.id)
    @documents = @case.documents
  end

  def create
      # unless params[:item_number] == nil
    # status = params[:payment_status]
    # puts ">>>>>>>>>>>>>>>>>>#{status}"
    # # if status == "Completed"
    #   puts ">>>>>>>>>>>>>>>>>#{params[:item_number]}"
    #   Payment.create(case_id: params[:item_number],notification_params: params[:invoice], status: status,transaction_id: params[:txn_id], purchased_at: Time.now,user_id: current_user.id)
    # end 
    # end
    
    @case=Case.new(case_params)
    if @case.save
      if params[:document]
        params[:document].each { |image|
        @case.documents.create(doc: image)
        }
        redirect_to cases_path 
      end
    else
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

  def doc_upload
  end

  def paypal_show
    
  end

  def case_purchase
    @cases1 = Case.all
  end

  def case_purchase_paypal
      #session[:buyer] = current_user.id
     redirect_to @case.paypal_url(show_not_cases_path(@case))
  end
  def hook
    byebug
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    puts ">>>>>>>>>>>>>>>>>>#{status}"
    if status == "Completed"
      pay=Payment.new
      pay.user_id=session[:buyer].id
      pay.case_id=params[:item_number]
      pay.save!

      # Payment.create(user_id: current_user.id,case_id: params[:item_number])
      #@case = Case.find params[:invoice]
      #@case.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end


  private
  def set_case
    @case = Case.find(params[:id])
  end

  def case_params
    params.require(:case).permit(:client_id,:advocate_id,:case_type_id,:case_title,:case_detail,:location,:status)
  end

  def doc_params
    params.require(:document).permit(:doc_file_name,:doc_content_type,:doc_file_size,:doc_updated_at)
  end

end