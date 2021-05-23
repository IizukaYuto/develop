class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :danger
  require "time"
  
  def after_sign_in_path_for(resource)
    if user_signed_in?
        pages_user_page_path 
    else 
        pages_kanri_path 
    end
  end
  
  # private
  #   def sign_in_required
  #       # redirect_to new_user_session_url unless user_signed_in?
  #   end
    
  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :task])
    end


end
