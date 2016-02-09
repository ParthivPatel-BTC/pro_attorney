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




  def edit
 #@case=Case.find(params[:id])
  end

  def new
    @case=Case.new
  end

  def create
       @case = Case.new(case_params)
    respond_to do |format|
      if @case.save
        format.html { redirect_to @case, notice: 'Case created.' }  
      else
        format.html { render :new }
       
      end
    end
  
  end

  def destroy
    if @case.destroy
      redirect_to cases_path
     end
end


 private

    def set_case
      @case = Case.find(params[:id])
    end



 def case_params
      params.require(:case).permit(:client_id,:advocate_id,:case_type_id,:case_title,:case_detail,:location,:status)
    end

end
