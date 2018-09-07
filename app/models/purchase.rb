class Purchase < ApplicationRecord
  # Relationships
  belongs_to :product
  belongs_to :user

  # We throw some validations, all fields are required, and the price and quantity
  # must be a positive number
  validates :product, :user, :quantity, :price, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than: 0 }
  # Custom validation of available stock of products, we can't buy 10 if we only
  # have 5 in stock for example
  validate :check_available_stock

  # Callback to set the price before validation
  before_validation :set_price
  # Callback to reduce the stock after the purchase
  after_create :reduce_available_stock


  private
    def set_price
      # We set the price directly from the current price of the product
      self.price = product.nil? ? nil : product.price
    end

    def check_available_stock
      if product.present? && product.stock < quantity
        errors.add(:quantity, "there is not enough stock to process your purchase (#{product.stock} available)")
      end
    end

    def reduce_available_stock
      # We are using the update column method, so it throws a raw Update SQL
      # without callbacks (We don't want to audit this changes on products)
      product.update_column(:stock, product.stock - quantity)
    end
end
