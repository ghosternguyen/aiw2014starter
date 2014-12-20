class Post < ActiveRecord::Base
	belongs_to :category
	mount_uploader :image, AttachmentUploader

	def self.search(query)
		if query
			str = []
			query.split.each do |s|
				a = where('title LIKE ? or description LIKE ?', "%#{s}%", "%#{s}%")
				str = (str + a).uniq
			end
			return str

		else
			find(:all)
		end
	end

end
