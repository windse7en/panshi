class Event < ActiveRecord::Base
	belongs_to :employee
	belongs_to :customer
	belongs_to :product
end
