class Admin < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :validatable

  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true
end
