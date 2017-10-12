class SessionsController < ApplicationController
  def new
  end

  def create
    # target_account = User.find_by(email: params[:session][:email])
    # if target_account && target_account.password == params[:session][:password]
    #   session[:user_id] = target_account.id
    #   redirect_to root_path, flash: { notice: "Hi #{target_account.first_name}" }
    # else
    #   redirect_to login_path, flash: { alert: "Invalid credentials" }
    # end

    results = ActiveRecord::Base.connection.execute("select * from users where email=\"#{params[:session][:email]}\" and password=\"#{params[:session][:password]}\" limit 1")
    target_account = results.first

    if target_account
      session[:user_id] = target_account["id"]
      redirect_to root_path, flash: { notice: "Hi #{target_account["first_name"]}" }
    else
      redirect_to login_path, flash: { alert: "Invalid credentials" }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { alert: "Successfully logged out" }
  end
end
