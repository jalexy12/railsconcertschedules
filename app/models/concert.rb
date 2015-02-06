class Concert < ActiveRecord::Base
	validates :name, presence:true 
	validates :date, presence:true 
	validates :artist, presence:true
	validates :venue, presence:true 
	validates :city, presence:true 
	validates :ticketprice, presence:true, numericality:true 
	validates :description, presence:true  
end
