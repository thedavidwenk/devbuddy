class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper :all # This is for the day_string helper method

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :avatar, :experience_level, :days_availability, :time_availability, :about_me, :programming_languages])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :avatar, :experience_level, :days_availability, :time_availability, :about_me, :programming_languages])
  end
end
