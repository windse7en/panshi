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
		if params.has_key?(:start) and params.has_key?(:end)
			start_day = params[:start].to_time
			end_day = params[:end].to_time
			event = Event.where(:reserve_start_at=>start_day..end_day)
			result = []
			event.map do |e|
				t = e.product
				te = e.employee
				tc = e.customer
				result.push e.attributes.slice("id","reserve_start_at","reserve_end_at","employee_id","customer_id","product_id", "event_comment").merge("product_name"=>t.product_name, "price"=>t.price,"employee_name"=>te.employee_name,"customer_name"=>tc.customer_name)
			end
		    respond_to do |format|
		      format.json { 
		        render json: result
		      }
		    end
		end
	end

	def get_all_info
		re_p = []
		re_e = []
		re_c = []
		product = Product.all
		employee = Employee.all
		customer = Customer.all
		result = []
		product.map do |e|
			re_p.push e.attributes.slice("id","product_name")
		end
		employee.map do |e|
			re_e.push e.attributes.slice("id","employee_name")
		end
		customer.map do |e|
			re_c.push e.attributes.slice("id","customer_name")
		end
		result.push re_p, re_e, re_c
	    respond_to do |format|
	      format.json { 
	        render json: result
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
