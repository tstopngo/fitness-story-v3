class User < ApplicationRecord
  has_secure_password

  has_many :logs

  validates :email, uniqueness: true
  validates :email, presence: true

  def self.from_omniauth(fb_auth)
    where(email: fb_auth['info']['email']).first_or_create do |u|
      u.email = fb_auth['info']['email']
      u.password = SecureRandom.hex
    end
  end

  def self.most_logs
    joins(:logs).group("users.id").order('count(logs.id) desc').limit(1).first
  end

end
