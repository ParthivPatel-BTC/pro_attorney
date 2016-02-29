class Case < ActiveRecord::Base
  belongs_to :case_type
  has_many :documents ,:dependent =>:destroy
  validates :user_id,:case_type_id,:case_title,:case_detail,:location,:status, presence:true 
   include PgSearch
  belongs_to :user
  pg_search_scope :search_by_all,
 :against => [:case_title, :case_detail, :location]
# def self.search(search)
#   if search
#     self.where(case_type_id:search.to_i)
#   else
#     self.all
#   end
#  end 
	
#will_paginate @cases
end
