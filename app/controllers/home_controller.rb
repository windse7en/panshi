class HomeController < ApplicationController
	def index
		if params.has_key?(:flag)
			render "index"
		elsif user_signed_in?
			redirect_to action:'homepage'
		end
	end
end
