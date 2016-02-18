class CasesController < ApplicationController
  before_action :set_case, only: [:show,:edit,:update,:destroy]

  def index
    @cases=Case.all
  end

  def show
  end

  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to @case, notice: 'Case was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete_document
    case_id=Document.find(params[:document]).case_id
    Document.destroy(params[:document])
    redirect_to edit_case_path(Case.find(case_id)) 
  end


  def edit
    #@case=Case.find(params[:id])
 @documents = @case.documents
  end

  def new
    @case=Case.new
    @documents = @case.documents

  end

  def create

@case=Case.new(case_params)
 if @case.save
   if params[:document]
        #===== The magic is here ;)
        params[:document].each { |image|
          @case.documents.create(doc: image)
        }
           redirect_to case_path(@case)

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