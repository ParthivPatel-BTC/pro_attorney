class Case < ActiveRecord::Base
	belongs_to :case_type
    has_one :payment, :dependent=>:destroy
	has_many :documents ,:dependent =>:destroy
	validates :client_id,:advocate_id,:case_type_id,:case_title,:case_detail,:location,presence:true 


serialize :notification_params, Hash
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
        notify_url: "#{Rails.application.secrets.app_host}/hook"
       #notify_url: "cases/hook"
    }
    
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end


end
