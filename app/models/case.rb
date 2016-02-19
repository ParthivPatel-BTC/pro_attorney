class Case < ActiveRecord::Base
  belongs_to :case_type
  has_many :documents ,:dependent =>:destroy
  validates :client_id,:advocate_id,:case_type_id,:case_title,:case_detail,:location,:status, presence:true 
  def self.search(search)
  if search
    self.where(case_type_id:search.to_i)
  else
    self.all
  end
end
end
