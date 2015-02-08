class CommentsController < ApplicationController
	def index
		 @comments = @concert.comments[:concertid]
	end
	def show
	end
	def destroy
		@concert = Concert.find params[:concertid]
		@comment = @concert.comments.find(params[:id])
		@comment.destroy
		redirect_to action: "index", controller: "concerts", project_id: @concert.id
	end
	
	def update 
		@concert = Concert.find params[:concertid]
		@comment = @concert.comments.find(params[:id])
		if @comment.update_attributes(comment_params)
			redirect_to action: "index", controller: "concerts", project_id: @concert.id
		else
			render 'edit'
		end
	end
	def edit
		@concert = Concert.find params[:concertid]
		 @comment= @concert.comments.find params[:id]
	end

	def new
		@concert = Concert.find params[:concertid]
		 @comment= @concert.comments.new
	end

	def create
		@concert =Concert.find params[:concertid]
		@comment = @concert.comments.new(comment_params)
		if @comment.save
			redirect_to action: "index", controller: "concerts", concertid: @concert.id
		else
			render 'new'
		end
	end
	private 
	def comment_params
		params.require(:comment).permit(:comments)
	end
end
