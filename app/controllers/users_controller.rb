class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if logged_in?
      current_user
    else
      redirect_to '/login'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
    end
end
