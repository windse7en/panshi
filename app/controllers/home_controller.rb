class HomeController < ApplicationController
	def index
		# Rack::MiniProfiler.step("homepage in the index function") do
		# 	if params.has_key?(:flag)
		# 		render "index"
		# 	elsif user_signed_in?
		# 			redirect_to action:'homepage'
		# 	end
		# end
	end

	def init_event
    respond_to do |format|
      format.json { 
        render json: Calendars.init
      }
    end
	end

	def update_event
		if params.has_key?(:id) and params.has_key?(:start) and params.has_key?(:product_id) and params.has_key?(:end) and params.has_key?(:employee_id) and params.has_key?(:customer_id) and params.has_key?(:event_comment)
			temp = Event.find(params[:id].to_i)
			begin
				# logger.debug(temp)
				# temp.update_attributes(:employee_id=>params[:employee_id].to_i, :customer_id=>params[:customer_id].to_i, :product_id=>params[:product_id].to_i)
				# logger.debug(params[:id])
				temp.update_attributes(:employee_id=>params[:employee_id].to_i, :customer_id=>params[:customer_id].to_i, :product_id=>params[:product_id].to_i, :event_comment=>params[:event_comment].to_s, :reserve_start_at=>params[:start].to_time, :reserve_end_at=>params[:end].to_time)
				result = "Success"
			rescue
				result = "Fail"
			end
			respond_to do |format|
				format.json {
					render json: {result: result}
				}
			end
		end
	end

end
