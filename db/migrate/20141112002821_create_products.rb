class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :product_name
      t.string :price
      t.string :amount
      t.string :unit
      t.string :image_address

      t.timestamps
    end
  end
end
