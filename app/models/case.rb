class Case < ActiveRecord::Base
	
	include PgSearch
	belongs_to :user
	belongs_to :case_type
	has_many :documents, dependent: :destroy
	validates :case_type_id, :case_title, :case_detail, :location, :status, presence:true 

	pg_search_scope :search_by_all,
	 :against => [:case_title, :case_detail, :location]
end