class LogsController < ApplicationController
  #before_action :current_user, :require_login

  def index
    @users = User.all
    if params[:user_id]
      @logs = User.find(params[:user_id]).logs
    elsif !params[:user].blank?
      @logs = Log.by_user(params[:user])
    elsif !params[:date].blank?
        if params[:date] == 'Newest'
          @logs = Log.newest
        else
          @logs = Log.oldest
        end
    else
      @logs= Log.all
    end
  end

  def new
    @log = Log.new(user_id: params[:user_id])
    @workout =  @log.workouts.build
    @log_workout = @workout.log_workouts.build
  end

  def create
    @log = Log.create(log_params)
    if @log.save
      redirect_to log_path(@log)
    else
      render :new
    end
  end

  def show
    @log = Log.find(params[:id])
  end

  def edit
    @log = Log.find(params[:id])
    @workout = @log.workouts
  end

  def update
    @log = Log.find(params[:id])
    @log.update(log_params)
    redirect_to log_path(@log)
  end

  def destroy
    Log.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  def newest
    @logs = Log.newest
    render 'index'
  end

  def oldest
    @logs = Log.oldest
    render 'index'
  end


private
    def log_params
      params.require(:log).permit(:workout_time,
                                  :calories,
                                  :user_id,
                                  workouts_attributes: [:id, :name, :workout_type,
                                  log_workouts_attributes: [:id, :amount]])
    end
end
