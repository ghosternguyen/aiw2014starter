class Category < ActiveRecord::Base
	has_belongs_to_many: posts
end
