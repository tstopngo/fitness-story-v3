class Log < ApplicationRecord
  belongs_to :user

  has_many :log_workouts, dependent: :destroy
  has_many :workouts, through: :log_workouts

  validates :calories, presence: true
  validates :workout_time, presence: true

  

  accepts_nested_attributes_for :workouts

    def self.by_user(user_id)
      where(user: user_id)
    end

    def self.newest
      order("created_at DESC")
    end

    def self.oldest
      order("created_at ASC")
    end


  #when creating a new workout from form check to see if it is db first
  def workouts_attributes=(workouts_attributes)
    workouts_attributes.values.each do |workout_attribute|
      workout = Workout.find_or_create_by(name: workout_attribute['name'], workout_type: workout_attribute['workout_type'])
      self.workouts << workout unless self.workouts.include?(workout)
        workout_attribute[:log_workouts_attributes].values do |log_workout_attribute|
          log_workout = LogWorkout.find_or_create_by(amount: log_workout_attribute['amount'])
          self.log_workouts << log_workout
        end
    end
  end
end
