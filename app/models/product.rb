class Product < ActiveRecord::Base

    attr_accessible :image_address, :unit, :amount, :price, :product_name

	has_many :event
end
