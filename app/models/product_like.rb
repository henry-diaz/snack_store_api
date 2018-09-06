class ProductLike < ApplicationRecord
  # counter cache increments the product_likes_count field on products (Likes by users)
  belongs_to :product, counter_cache: true
  belongs_to :user

  # We validate both associations exist
  validates :user, :product, presence: true
  # A user can like a product, one time, so we validate the uniqueness of this relationship
  validates :user_id, uniqueness: { scope: :product_id, message: 'A user can like a product only one time' }
end
