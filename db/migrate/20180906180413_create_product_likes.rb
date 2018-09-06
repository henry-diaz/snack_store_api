class CreateProductLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_likes do |t|
      t.references :product, index: true
      t.references :user, index: true
      t.timestamps
    end
    # Can be a HABTM table, but I want to save the created_at reference to know
    # when the user likes the product and, if this were a ranking, we could save
    # the stars for example
  end
end
