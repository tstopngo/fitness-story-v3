class Workout < ApplicationRecord
  has_many :log_workouts, dependent: :destroy
  has_many :logs, through: :log_workouts

  validates :workout_type, inclusion: {in: %w(Aerobic Strength Balance Flexibility)}
  validates :name, uniqueness: true

  accepts_nested_attributes_for :log_workouts
end
