class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
   
    if user&.authenticate params[:password]
      session[:user_id] = user.id
      flash[:success] = "User Logged In"
      redirect_to ideas_path, status: 303
    else
      flash[:warning] = "Couldn't Log In, Please Try Again"
      render :new, status: 303
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to ideas_path, status: 303
  end
end