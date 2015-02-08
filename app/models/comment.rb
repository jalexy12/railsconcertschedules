class Comment < ActiveRecord::Base
	belongs to :concert
	validates :userid, presence:true, numericality: true
	validates :concertid, presence:true, numericality:true
	validates :comments, presence:true
	
end
