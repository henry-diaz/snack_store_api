class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :validatable,
         :trackable

  include DeviseTokenAuth::Concerns::User

  validates :name, :gender, presence: true
  validates :gender, inclusion: { in: %w(m f) }
  # Devise validatable already add some validations for email and password
end
