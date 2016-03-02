class Case < ActiveRecord::Base
	
	include PgSearch
	belongs_to :user
	belongs_to :case_type
    has_many :payments, dependent: :destroy
	has_many :documents , dependent: :destroy
	validates :case_type_id, :case_title, :case_detail, :location, :status, presence:true 

	pg_search_scope :search_by_all,
	 :against => [:case_title, :case_detail, :location]

	 #will_paginate @cases
  #paypal methods
  def paypal_url(return_path)
    values = {
        business: "manojparmar5606-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: Payment.pluck(:id).max+1,
        amount: self.case_type.amount,
        item_name: self.case_title,
        item_number: self.id,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end