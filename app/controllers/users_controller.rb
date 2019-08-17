class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:create, :new]

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
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
    end
end
