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

        workouts_attributes.values.each do |workout_attribute
        #workous_attributes gives you the values of the hash, which has an array of "workout objects"

          workout= Workout.find_or_create_by(name: workout_attribute[:name], workout_type: workout_attribute[:workout_type])
          #find the workout object from the pipes or create a new one with the arguments

          self.workouts << workout unless self.workouts.include?(workout)
          #add the workout object to the proxy collection unless it has it already

          workout_attribute[:log_workouts_attributes].values.each do |log_workout_attribute|
          #key into the nested information workout attribute and grab the log_workout attributes, which includes amount, wokrout_id, and log_id

  				if self.log_workouts.any? do |log_workout|
            #check if logs have any log_workouts if true then pass each log_workout through pipes

              log_workout.log_id == self.id && log_workout.workout_id == workout.id
              #set the the ids of the log and workout to the log_workout
            end
            log_workout = self.log_workouts.select do |i|
  					#select the log_workout from logs
              i.workout_id == workout.id && i.log_id == self.id
  						#select the log_workout from the log_wokrouts where the the Workout ID and Log Id match
            end.first

            log_workout.amount = log_workout_attribute[:amount] unless log_workout_attribute.blank?
  					#write the amount to the Join Table
            log_workout.save


          else
            log_workout = self.log_workouts.select {|i| i.workout_id == workout.id}.first
            log_workout.amount = log_workout_attribute unless log_workout_attribute.blank?
  					#if there are no log workouts then then select the workout id that matches and write the amount
            log_workout.save
          end
        end
        end
  end
