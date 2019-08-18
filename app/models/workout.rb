class Workout < ApplicationRecord
  has_many :logs
  has_many :users, through: :log_workouts

  validates :workout_type, inclusion: {in: %w(Aerobic Strength Balance Flexibility)}
  validates :name, uniqueness: true
end
