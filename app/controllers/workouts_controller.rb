class WorkoutsController < ApplicationController
  before_action :require_login

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.create(workout_params)
  end

  def edit
    
  end

  def update

  end

  def destroy

  end

  private

end
