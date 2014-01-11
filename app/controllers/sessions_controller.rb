class SessionsController < Devise::SessionsController
  skip_before_filter :authenticate_user_from_token!, :only => [:create]
  skip_after_filter  :verify_authorized

  # POST /login
  # Find user
  def create
    resource = User.find_for_database_authentication(name: params[:user][:name])
    return failure unless resource
    return failure unless resource.valid_password?(params[:user][:password])
    handle_success(resource)
  end

  def failure
    render :nothing => true, :status => :unauthorized
  end

  # DELETE /logout
  # Delete User session
  def destroy
    current_user.logout
    render :json => {:success => true, :message => "logged out"}
  end

  private

  # Make User a new authentication token and a encrypted name, then return those to client
  def handle_success(resource)
    token = resource.ensure_authentication_token
    name = AES.encrypt(resource.name, Aktivator::Application.config.secret_key_base)
    render :json => {:success => true, :name => name, :token => token, :username => resource.name}
  end
end
