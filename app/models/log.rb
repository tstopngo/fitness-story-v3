class Log < ApplicationRecord
  belongs_to :user

  has_many :log_workouts, dependent: :destroy
  has_many :workouts, through: :log_workouts

  validates :calories, presence: true
  validates :workout_time, presence: true

  accepts_nested_attributes_for :workouts

  #when creating a new workout from form check to see if it is db first
  def workout_attributes=(workout_attributes)
    workout_attributes.values.each do |workout_attribute|
      workout = Workout.find_or_create_by(workout_attitbute)
      self.workouts << workout
    end
  end
end
