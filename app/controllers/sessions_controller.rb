class SessionsController < ApplicationController

    def new
    end

    def create
      if user = User.find_by(email: params[:session][:email])
        session[:user_id] = user.id
        redirect_to root_path, flash: { success: "Hi #{user.first_name}" }
      else
        redirect_to login_path, flash: { error: "Username is not found" }
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, flash: { success: "Successfully logged out" }
    end

  end
