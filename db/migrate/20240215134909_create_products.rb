class CreateProducts < ActiveRecord::Migration[7.1]
  def up
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :image_url
      t.text :description
      t.integer :price
      t.integer :quantity
      t.timestamps
    end
  end

  def down
    drop_table :products
  end

end
