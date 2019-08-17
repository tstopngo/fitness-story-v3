class LogsController < ApplicationController
  belongs_to :user
  has_many :workouts, through: :log_workouts

  before_action :require_login
end
