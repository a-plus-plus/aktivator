class ApplicationController < ActionController::Base
	include ActionController::MimeResponds
	include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  #before_filter :authenticate_user_from_token!
  #before_filter :authenticate_user!

  #after_filter :verify_authorized, :except => [:greet]
  #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #before_filter :configure_permitted_parameters, if: :devise_controller?

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  private
    
  def authenticate_user_from_token!
    auth_service = AuthenticationService.new
    user = auth_service.authenticated?(request.headers["name"], request.headers["token"])
    sign_in user, store: false if user
  end

  def user_not_authorized
    current_user.logout
    render :nothing => true, :status => :unauthorized
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :password, :remember_me) }
  end

end
