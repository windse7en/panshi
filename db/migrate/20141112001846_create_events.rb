class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

    	# employee and customer id, product id, employee id
      t.integer :employee_id
      t.integer :customer_id
      t.integer :product_id

      t.string :event_comment

      # event reserved time.
      t.datetime :reserve_start_at
      t.datetime :reserve_end_at

      t.timestamps
    end
  end
end
