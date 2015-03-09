class UsersController < ApplicationController
  before_filter :authorize

  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end

  def authorize
    if current_user.nil?
      redirect_to login_path, alert: "You are not authorized to access this page."
    end
  end
end