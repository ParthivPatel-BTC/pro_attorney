module CaseHelper
	def uploaded_documents
		docs = ""
    @case.documents.each do |doc|
      docs += "* #{doc.doc_file_name}<br>"
    end
    docs += "No Documents Uploaded " if @case.documents.count == 0 
      return docs.html_safe
	end
end
