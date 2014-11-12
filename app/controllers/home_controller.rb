class HomeController < ApplicationController
	def index
		if params.has_key?(:flag)
			render "index"
		elsif user_signed_in?
			redirect_to action:'homepage'
		end
	end

	def init_event
		@event = Event.all
	    respond_to do |format|
	      format.json { 
	        render json: @event.map
	      }
	    end
	end

end
