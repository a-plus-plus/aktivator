class Tagging < ActiveRecord::Base
	has_many :tags
	has_many :surveys
end
