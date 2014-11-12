class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|

      t.string :customer_name
      t.string :telephone
      t.string :address
      t.string :zipcode

      t.timestamps
    end
  end
end
