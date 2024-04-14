class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    helper_method :current_conversation,:main_user

    def current_conversation 
        @conversation||= Conversation.find(session[:conversation_id]) if session[:conversation_id]
    end 

    def main_user 
      @user||= current_user 
    end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone_number, :full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone_number, :full_name, :profile_pic, :bio,:private])
  end


end
