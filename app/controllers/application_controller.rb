class ApplicationController < ActionController::Base
	include ActionController::MimeResponds
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  #after_filter :verify_authorized, :except => [:greet]
  respond_to :json
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
  	p "#{request.headers['name']}"
    auth_service = AuthenticationService.new
    user = auth_service.authenticated?(request.headers["name"], request.headers["token"])
    sign_in user, store: false if user
  end

  def user_not_authorized
    current_user.logout
    render :nothing => true, :status => :unauthorized
  end

end
