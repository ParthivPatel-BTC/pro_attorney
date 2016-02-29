module CaseHelper
  def uploaded_documents
    docs=""
       @case.documents.each do |doc|
        docs+="* #{doc.doc_file_name}<br>"
       end
       docs+="No Documents Uploaded " if @case.documents.count==0 
       return docs.html_safe
  end


 def show_documents
    docs = ""
    @user_case.documents.each do |doc|
      docs += " #{doc.doc_file_name}<br>"
    end
    return docs.html_safe
  end
	
	    # def selected_case_type
	    #   if @cases.first.case_type_id ==nil
	    #     return 1
	    #   else
	    #     return @cases.first.case_type_id
	    #   end
	    # end
	

end