class LogSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :calories, :workout_time
  belongs_to :user
  has_many :log_workouts
end
