class Case < ActiveRecord::Base
	
	include PgSearch
	belongs_to :user
	belongs_to :case_type
	has_many :documents, dependent: :destroy
	validates :case_type_id, :case_title, :case_detail, :location, :status, presence:true 

	pg_search_scope :search_by_all,
	 :against => [:case_title, :case_detail, :location]

	  def paypal_url(return_path)
    values = {
      business:"gauravmakwana93-facilitator@gmail.com",
      cmd: "_xclick",
      upload: 1,
      return: "#{Rails.application.secrets.app_host}#{return_path}",
      invoice: id,
      amount: self.case_type.amount,
      case_title:self.case_title,
      item_number: self.id,
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end	
end