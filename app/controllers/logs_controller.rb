class LogsController < ApplicationController

  before_action :require_login

  def new
    @log = Log.new
  end

  def create
    @log = Log.create(log_params)
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
    redirect_to logs_path
  end

  private
    def log_params
      params.require(:log).permit(:workout, :time)
    end
end
