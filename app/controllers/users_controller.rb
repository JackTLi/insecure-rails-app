class UsersController < ApplicationController

  def new
  end

  def create
    User.create(params[:user].permit!)
  end
end
