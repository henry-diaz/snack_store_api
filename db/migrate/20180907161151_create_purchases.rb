class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    # We're gonna make a simple purchase model, one user buy one product
    # In production environment the purchases requires a more complex database schema
    create_table :purchases do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.integer :quantity, default: 0
      t.decimal :price, precision: 12, scale: 2
      # We save the price on purchase, cause this can be changed for the admin
      # in any moment they desired
      t.timestamps # our created_at field is gonna be the purchase date
    end
  end
end
