class SessionsController < ApplicationController
  def homepage
   @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(:email => params[:user][:email])
    @user = @user.try(:authenticate, params[:user][:password])
    return redirect_to '/signup' unless @user
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end


end
