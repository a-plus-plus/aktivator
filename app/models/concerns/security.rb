# Module for User authentication token
module Security
  extend ActiveSupport::Concern

  # Generate, save and apply authentication token for User
  def ensure_authentication_token
    self.authentication_token = generate_authentication_token
    self.save!
    self.authentication_token
  end

  # Clear authentication token
  def logout
    self.authentication_token = ""
    self.save!
  end

  private

  # Generation of authentication token with the help of Devise
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
