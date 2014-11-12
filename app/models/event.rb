class Event < ActiveRecord::Base

	attr_accessible :employee_id, :customer_id, :product_id, :event_comment, :reserve_start_at, :reserve_end_at

	belongs_to :employee
	belongs_to :customer
	belongs_to :product
end
