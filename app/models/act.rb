class Act < ActiveRecord::Base
	#has_and_belongs_to_many :users
	has_many :lists
	has_many :users, :through => :lists
end
