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
  #def workouts_attributes=(workouts_attributes)
  #  workouts_attributes.values.each do |workout_attribute|
  #    workout = Workout.find_or_create_by(wpr)
  #    self.workouts << workout unless self.workouts.include?(workout)
  #    end
  #  end

    def workouts_attributes=(workouts_attributes)
      workouts_attributes.values.each do |workout_attribute|
        workout= Workout.find_or_create_by(name: workout_attribute[:name], workout_type: workout_attribute[:workout_type])
        self.workouts << workout unless self.workouts.include?(workout)
        workout_attribute[:log_workouts_attributes].values.each do |log_workout_attribute|

        if self.log_workouts.any? do |log_workout|
            log_workout.log_id == self.id && log_workout.workout_id == workout.id
          end
          log_workout = self.log_workouts.select do |i|
            i.workout_id == workout.id && i.log_id == self.id
          end.first
          log_workout.amount = log_workout_attribute[:amount] unless log_workout_attribute.blank?
          log_workout.save
        else
          log_workout = self.log_workouts.select {|i| i.workout_id == workout.id}.first
          log_workout.amount = log_workout_attribute unless log_workout_attribute.blank?
          log_workout.save
        end
      end
      end
    end
  end
