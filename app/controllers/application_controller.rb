class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :setup_user

  def ensure_current_user
    redirect_to :root and return unless current_user
  end

  def setup_user
    @user ||= current_user if current_user
  end

  def ensure_gm!
    redirect_to :back, notice:"I don't think so" and return unless current_user.is_gm?(@campaign)
  end

end
