class SessionsController < ApplicationController
  def homepage
  end

  def new
  end

  def create
    @user = User.find_by(username => params[:username])
  end


end
