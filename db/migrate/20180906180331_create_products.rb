class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :stock, default: 0, index: true
      t.decimal :price, precision: 12, scale: 2
      t.integer :product_likes_count, default: 0, index: true # counter cache column to product likes
      t.timestamps
    end
  end
end
