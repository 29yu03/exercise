class ApplicationController < ActionController::Base
   # before_action :authenticate_customer!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_top_path
    when User
      user_path(resource)
    else
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    user_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number] )
  end
end
