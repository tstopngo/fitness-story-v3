class OmniauthController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.email = auth['info']['email']
      u.password = auth['credentials']['token']
    end
    session[:user_id] = @user.id
    flash[:message] = "Logged in via Facebook!"
    redirect_to user_path(@user)
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
