class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|

      t.string :employee_name
      t.string :telephone
      t.string :address
      t.string :zipcode

      t.timestamps
    end
  end
end
