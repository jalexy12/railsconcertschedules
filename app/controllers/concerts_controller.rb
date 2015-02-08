class ConcertsController < ApplicationController
	def index
		@concerts = Concert.all
		if @concerts.empty?
			render "no_concerts_found"
		end
	end

	def home
		today = Date.today
		@concerts = Concert.where("date = ?", today)
		@monthsconcerts = Concert.concerts_for(today)
	end

	def show
		unless @concert = Concert.find_by(id: params[:id])
			render 'no_concerts_found'
		end
	end
	def new
		@concert = Concert.new
	end

	def edit 
		@concert = Concert.find params[:id]
	end

	def create 
		@concert = Concert.new(concert_params)
		if @concert.save
			redirect_to action: "index", controller: "concerts"
		else
			render "new"
		end
	end

	def update
		@concert = Concert.find params[:id]
		if @concert.update_attributes(concert_params)
			redirect_to action: "index", controller: "concerts"
		else
			render "edit"
		end
	end

	def destroy 
		@concert = Concert.find(params[:id])
		@concert.destroy
		redirect_to action: "index", controller: "entries"
	end

	private

	def concert_params
		params.require(:concert).permit(:name, :date, :artist, :venue, :city, :ticketprice, :description)
	end

end
