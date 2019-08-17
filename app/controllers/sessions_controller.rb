class SessionsController < ApplicationController
  def homepage
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(:email => params[:email])
    user = user.try(:authenticate, params[:password])
    return redirect_to '/signup' unless user
    session[:user_id] = user.id
    @user = user
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end


end
