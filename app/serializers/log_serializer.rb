class LogSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :calories, :workout_time
  belongs_to :user

  has_many :log_workouts, dependent: :destroy
  has_many :workouts, through: :log_workouts
end
