class ApplicationController < ActionController::Base

  private

  def current_user
    current_user ||= User.find_by_id session[:user_id] # ||= will only assign @current_user if it is nil. Otherwise continue using it's
  end
  helper_method :current_user

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def authenticate_user!
    redirect_to new_session_path, {alert: "You need to be signed in first!", status: 303} unless user_signed_in?
  end
  helper_method :authenticate_user!

end