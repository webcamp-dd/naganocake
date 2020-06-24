class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
      
      def after_sign_out_path_for(a)
        if a == :admin
          new_admin_session_path
        else
          root_path
        end
      end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kana_family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kana_first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:postal_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
  end
end

