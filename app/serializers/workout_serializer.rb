class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :log_workouts, dependent: :destroy
  has_many :logs, through: :log_workouts
end
