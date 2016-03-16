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
      docs += "<br><a href='/documents/#{doc.id}/#{doc.doc_file_name}' target='new'> #{doc.doc_file_name}</a>"
    end
    return "<span class='handle ui-sortable-handle'><i class='fa fa-fw fa-paperclip fa-lg'></i></span>Attachements#{docs}".html_safe
  end

  def default_case_type
    if params[:case_type] == nil
      return "All"
    else
      return params[:case_type] 
    end
	end

  def case_status_style(user_case)
    if user_case.status == "open"
      "green"
    else
      "red"
    end
  end
end