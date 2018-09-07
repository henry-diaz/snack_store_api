class Product < ApplicationRecord
  # Active Storage, this model is gonna have one image associated
  has_one_attached :image
  # Quick note with Active Storage, right now doesn't support a file validation
  # this featured come in rails 6, you can always do some tweaks to make it work
  # but for this demo, we make it basic.

  # Relationship with product likes, if we eliminate this product the associations
  # will destroy too (I don't want orphans registers in this testing project)
  has_many :product_likes, dependent: :destroy

  # Custom validations
  validates :name, :stock, :price, presence: true
  # we add a uniqueness validation on name of product
  validates :name, uniqueness: { case_sensitive: false }
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than: 0 }

  def image_url
    Rails.application.routes.url_helpers.rails_blob_url(image)
  end
end
