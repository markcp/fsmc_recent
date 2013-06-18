# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :username, presence: true
  has_secure_password
  before_save :create_remember_token

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
