class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :validatable,
         :trackable

  include DeviseTokenAuth::Concerns::User

  validates :name, :gender, presence: true
  validates :gender, inclusion: { in: %w(m f) }
  # Devise validatable already add some validations for email and password

  # We're gonna send a email after a user registration
  after_create :send_mail

  private
    def send_mail
      ApplicationMailer.new_user(self).deliver_now
    end
end
