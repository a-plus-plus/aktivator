class SessionsController < Devise::SessionsController
  skip_before_filter :authenticate_user_from_token!, :only => [:create]
  skip_after_filter  :verify_authorized
  
  def create
    resource = User.find_for_database_authentication(name: params[:user][:name])
    # debugger
    return failure unless resource
    return failure unless resource.valid_password?(params[:user][:password])
    handle_success(resource)
  end
 
  def failure
    render :nothing => true, :status => :unauthorized
  end

  def destroy
    current_user.logout
    render :json => {:success => true, :message => "logged out"}
  end

  private
  def handle_success(resource)
    token = resource.ensure_authentication_token
    name = AES.encrypt(resource.name, Aktivator::Application.config.secret_key_base)
    render :json => {:success => true, :name => name, :token => token}
  end	
end
