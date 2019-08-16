class LogWorkout < ApplicationRecord
  belongs_to :workout
  belongs_to :user
end
