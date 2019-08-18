class Log < ApplicationRecord
  belongs_to :user
  has_many :workouts, through: :log_workouts

  validates :calories, presence: true
  validates :workout_time, presence: true
end
