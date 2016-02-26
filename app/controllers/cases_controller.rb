class CasesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_case, only: [:show,:edit,:update,:destroy,:client_details]

  def index
    if current_user.is_client?
     if params[:search].blank?
      @cases = Case.find_by(user_id: current_user.id).paginate(page: params[:page], per_page: t("per_page")) unless Case.find_by(user_id: current_user.id)==nil
     else
      @cases = Case.find_by(user_id: current_user.id).search_by_all(params[:search]).paginate(page: params[:page], per_page: t("per_page"))
     end 
   else
      if params[:search].blank?
      @cases = Case.paginate(page: params[:page], per_page: t("per_page"))
     else
      @cases = Case.paginate(page: params[:page], per_page: t("per_page"))
     end 
    end
  end



  def client_details
  end
  def show
  end
  
  def update
    if @case.update(case_params)
     redirect_to @case
    else
      render :edit 
    end
  end

  def send_purchase_mail
      client=Case.find(params[:id]).user
      advocate=User.find(current_user.id)
      puts "#{current_user.id}"
      UserMailer.purchase(client,advocate).deliver_now
      redirect_to cases_path
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
    @case = Case.new(user_id: current_user.id)
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
  
  def doc_upload
  end

  private
  
  def set_case
    @case = Case.find(params[:id])
  end

  def case_params
    params.require(:case).permit(:user_id, :case_type_id, :case_title, :case_detail, :location,:status)
  end

  def doc_params
    params.require(:document).permit(:doc_file_name, :doc_content_type, :doc_file_size, :doc_updated_at)
  end
end