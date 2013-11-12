class Tag < ActiveRecord::Base
   has_and_belongs_to_many :surveys
   validates :title, :presence => true, :length => {:in => 3..20}, uniqueness: true
end
