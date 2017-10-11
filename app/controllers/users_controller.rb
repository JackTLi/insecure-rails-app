class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to root_path, flash: { notice: "Account #{user.email} created" }
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    return head :forbidden unless current_user == @user
  end

  def update
    user = User.find(params[:id])
    return head :forbidden unless current_user == user

    user.update_attributes(user_params)

    redirect_to user_path(user), flash: { notice: "#{user.inspect}" } unless user.first_name == "HAX"
  end

  def user_params
    params.require(:user).permit!
  end
end
