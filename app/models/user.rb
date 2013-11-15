class User < ActiveRecord::Base
	include Security
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

	has_many :surveys
	validates :name, :presence => true, :uniqueness => true, :length => {:in => 3..20}
	validates_length_of :password, :in =>6..20, :on => :create
	
end
