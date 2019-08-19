class LogsController < ApplicationController
  before_action :current_user, :require_login

  def new
    @log = Log.new
  end

  def create
    @log = Log.create(log_params)
    if @log.valid?
      @log.save
      redirect_to log_path (@log)
    else
      render :new
    end
  end

  def show
    @log = Log.find_by(params[:id])
  end

  def edit
    @log = Log.find_by(params[:id])
  end

  def update
    @log = Log.find_by(params[:id])
    @log.update(log_params)
    redirect_to log_path(@log)
  end

  def destroy
    @log = Log.find_by(params[:id])
    @log.destroy
    redirect_to user_path(current_user)
  end

  private
    def log_params
      params.require(:log).permit(:workout_time, :calories, :user_id, workout_attributes: [:name, :workout_type], log_workout_attributes: [:amount])
    end
end
