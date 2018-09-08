class Admin < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :validatable

  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true

  # We're gonna send a email after a admin registration
  after_create :send_mail

  private
    def send_mail
      ApplicationMailer.new_admin(self).deliver_now
    end
end
