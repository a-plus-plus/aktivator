class User < ActiveRecord::Base
	has_many :surveys
	validates :name, :presence => true, :uniqueness => true, :length => {:in => 3..20}
	validates_length_of :password, :in =>6..20, :on => :create


end
