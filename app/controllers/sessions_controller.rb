class SessionsController < ApplicationController
  def homepage
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    if fb_auth = auth
      @user = User.from_omniauth(fb_auth)
    else
      @user = User.find_by(:email => params[:user][:email])
      @user = @user.try(:authenticate, params[:user][:password])
      return redirect_to '/signup' unless @user
    end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private
  def auth
    request.env['omniauth.auth']
  end

end
