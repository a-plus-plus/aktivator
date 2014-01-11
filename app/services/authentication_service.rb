# Authentication helper for header-based token authentication
class AuthenticationService

  # Get encrypted name and token from client headers
  def authenticated?(encrypted_name, user_token)
    user = get_user_from_encrypted_name(encrypted_name)
    if valid_token?(user, user_token)
      return user
    else
      return nil
    end
  end

  # Decrypt username
  def get_user_from_encrypted_name(encrypted_name)
    if encrypted_name && !encrypted_name.blank?
      user_name = AES.decrypt(encrypted_name, Aktivator::Application.config.secret_key_base)
      user       = User.find_by_name(user_name)
    end
    user
  end

  # Check token validity
  def valid_token?(user, user_token)
    user && !user_token.blank? && Devise.secure_compare(user.authentication_token, user_token)
  end

end
