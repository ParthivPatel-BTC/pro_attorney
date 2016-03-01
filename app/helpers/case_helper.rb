module CaseHelper
  def uploaded_documents
    docs=""
       @user_case.documents.each do |doc|
        docs+="* #{doc.doc_file_name}<br>"
       end
       docs+="No Documents Uploaded " if @user_case.documents.count==0 
       return docs.html_safe
  end


  def show_documents
    docs = ""
    @user_case.documents.each do |doc|
      docs += " #{doc.doc_file_name}<br>"
    end
    return docs.html_safe
  end

  def default_case_type(user_case)
    if user_case.case_type_id == nil
      return CaseType.first.id.to_s 
    else
      return  user_case.case_type.id.to_s
    end
	end
	    # def selected_case_type
	    #   if @cases.first.case_type_id ==nil
	    #     return 1
	    #   else
	    #     return @cases.first.case_type_id
	    #   end
	    # end
	

end