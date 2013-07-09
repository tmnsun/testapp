class Post < ActiveRecord::Base
	has_many :comments

	acts_as_url :title

	attr_accessible :announce, :body, :title

	def to_param
  		url
	end
end
