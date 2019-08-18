class Log < ApplicationRecord
  belongs_to :user

  has_many :log_workouts
  has_many :workouts, through: :log_workouts

  validates :calories, presence: true
  validates :workout_time, presence: true

  accepts_nested_attributes_for :log_workouts

  def workout_attributes=(workout_attributes)
    workout_attributes.values.each do |workout_attribute|
      workout = Workout.find_or_create_by(workout_attitbute)
      self.workouts << workout
    end
  end
end
