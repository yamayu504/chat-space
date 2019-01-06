class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

   protected
     def configure_permitted_parameters
       #以下の:name部分は追加したカラム名に変える
       devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
     end
     def after_sign_out_path_for(resouce)
        new_user_session_path
     end
end
