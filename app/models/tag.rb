class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :surveys, :through => :taggings
end
