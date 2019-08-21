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
    binding.pry
    workouts_attributes.values.each do |workout_attribute|
      workout = Workout.find_or_create_by(name: workout_attribute[:name])
      self.log_workouts.build(workout: workout)

    end
  end
  end
