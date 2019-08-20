class LogWorkout < ApplicationRecord
  belongs_to :log
  belongs_to :workout
  validates :amount, presence: true
end
