class WorkoutsController < ApplicationController
  before_action :require_login

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.create(workout_params)
    if @workout.valid?
      @workout.save
      redirect_to log_path (@workout)
    else
      render :new
    end
  end

  def show
    @workout = Workout.find_by(params[:id])
  end

  def edit
    @workout = Workout.find_by(params[:id])
  end

  def update
    @workout = Workout.find_by(params[:id])
    @workout.update(workout_params)
    redirect_to workout_path(@workout)
  end

  def destroy
    @workout = Workout.find_by(params[:id])
    @workout.destroy
    redirect_to workouts_path
  end

  private
    def workout_params
      params.require(:workout).permit(:name, :type)
    end

end
