class User < ApplicationRecord
  has_secure_password

  has_many :logs
  has_many :workouts, through: :log_workouts

  validates :email, uniqueness: true
  validates :email, presence: true
end
