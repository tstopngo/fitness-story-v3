class LogWorkout < ApplicationRecord
  belongs_to :workout_id
  belongs_to :log_id
end
