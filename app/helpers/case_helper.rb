module CaseHelper
  def show_documents
    docs = ""
    @user_case.documents.each do |doc|
      docs += " #{doc.doc_file_name}<br>"
    end
    return docs.html_safe
  end
end