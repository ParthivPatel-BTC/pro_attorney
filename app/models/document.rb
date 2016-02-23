class Document < ActiveRecord::Base
	belongs_to :case
	has_attached_file :doc, path: ":rails_root/app/assets/documents/:basename.:extension"
  validates_attachment_content_type :doc, content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain"], message: ', Only PDF, EXCEL, WORD or TEXT files are allowed. '
end