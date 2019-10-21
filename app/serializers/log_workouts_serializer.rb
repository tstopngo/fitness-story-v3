class LogWorkoutsSerializer < ActiveModel::Serializer
  attributes :id, :amount
  belongs_to :log
  belongs_to :workout
end
