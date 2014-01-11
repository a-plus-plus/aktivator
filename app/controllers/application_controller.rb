class ApplicationController < ActionController::Base
	include ActionController::MimeResponds

  before_filter :skip_trackable

  # By default require authorization for every action,
  # overrides are found within the controllers
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  # Respond only to JSON
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

  # Primary method for token authentication, checks AES-encrypted name- and header-tokens
  def authenticate_user_from_token!
    auth_service = AuthenticationService.new
    user = auth_service.authenticated?(request.headers["name"], request.headers["token"])
    sign_in user, store: false if user
  end

  # Skip sign_in in authenticate_user_from_token! triggering the User-table update
  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end

end
