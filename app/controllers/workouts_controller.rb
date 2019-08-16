class WorkoutsController < ApplicationController
  has_many :logs
  has_many :users through: :log_workouts
end
