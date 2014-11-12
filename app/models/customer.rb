class Customer < ActiveRecord::Base

	attr_accessible :customer_name, :telephone, :address, :zipcode

	has_many :event
end
