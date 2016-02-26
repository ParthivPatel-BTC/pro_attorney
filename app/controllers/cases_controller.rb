class CasesController < ApplicationController
  before_action :set_case, only: [:show,:edit,:update,:destroy]

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