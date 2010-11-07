class User < ActiveRecord::Base
	has_many :microposts

	attr_accessible :name, :email
end
