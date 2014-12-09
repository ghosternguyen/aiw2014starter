class Post < ActiveRecord::Base
	belongs_to: users
	has_belongs_to_many: categories
end
