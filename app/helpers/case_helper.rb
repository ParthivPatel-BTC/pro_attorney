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
    return "<span class='handle ui-sortable-handle'><i class='fa fa-fw fa-paperclip fa-lg'>Attachements#{docs}".html_safe
  end

  def default_case_type(user_case)
    if user_case.case_type_id == nil
      return CaseType.first.id.to_s 
    else
      return  user_case.case_type.id.to_s
    end
	end

  def case_status_style(user_case)
    if user_case.status == "open"
      "green"
    else
      "red"
    end
  end

  def case_created_time(user_case)
    days=0
    hours=(Time.now - user_case.created_at)/3600
    if hours >= 24
        "#{(hours/24).to_i} Days #{(hours%24).to_i} Hours ago"
    else
       "#{(hours).to_i} Hours ago"
    end
  end
end