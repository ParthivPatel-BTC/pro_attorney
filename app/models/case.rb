class Case < ActiveRecord::Base	
	include PgSearch
	belongs_to :user
	belongs_to :case_type
  has_many :payments, dependent: :destroy
	has_many :documents , dependent: :destroy
  has_many :payments , dependent: :destroy
  has_one :user_profile,:through => :user
	validates :case_type_id, :case_title, :case_detail, :location, :status, presence:true 

 pg_search_scope :search_by_all,
	:against => [:case_title, :case_detail, :location, :status],
  :using => {:tsearch => {:prefix => true}}

	 #will_paginate @cases
  #paypal methods
  if(Payment.count == 0)
    @invoice=1
  else
    @invoice=Payment.pluck(:id).max+1
  end
  def paypal_url(return_path)
    values = {
        business: "gauravmakwana93-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: @invoice,
        amount: self.case_type.amount,
        item_name: self.case_title,
        item_number: self.id,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

  def self.case_type_search(case_type_param=nil)
    if( case_type_param == nil || case_type_param == "All")
      Case.all
    else
      Case.where(case_type_id: CaseType.find_by(case_type: case_type_param).id)
    end
  end   
end