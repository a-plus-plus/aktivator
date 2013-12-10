class User < ActiveRecord::Base
	include Security
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :surveys
  validates_uniqueness_of :name, :message => 'Username is already in use!'
  validates_uniqueness_of :email, :message => 'E-mail has been registered already!'
  
end
