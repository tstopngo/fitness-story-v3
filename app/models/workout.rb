class Workout < ApplicationRecord
  has_many :logs
  has_many :users through: :log_workouts

  validates :type, inclusion: {in: %w(Aerobic Strength Balance Flexibility}
end
