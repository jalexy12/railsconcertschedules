class Concert < ActiveRecord::Base
	has_many :comments
	validates :name, presence:true 
	validates :date, presence:true 
	validates :artist, presence:true
	validates :venue, presence:true 
	validates :city, presence:true 
	validates :ticketprice, presence:true, numericality:true 
	validates :description, presence:true  
	def self.concerts_for(date)
		Concert.where(date: date.beginning_of_month..date.end_of_month)
	end
end
