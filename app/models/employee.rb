class Employee < ActiveRecord::Base

	attr_accessible :employee_name, :telephone, :address, :zipcode

	has_many :event
end
