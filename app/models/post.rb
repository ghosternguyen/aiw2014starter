class Post < ActiveRecord::Base
	belongs_to :category, foreign_key: :id
	mount_uploader :image, AttachmentUploader
end
