class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  def create
    build_resource(sign_up_params)

    if verify_recaptcha(model: resource) && resource.save
      sign_up(resource_name, resource)
      respond_with resource, location: users_path
    else
      flash[:alert] = "Please complete the CAPTCHA to proceed."
      render 'new'
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :experience_level])
  end
end