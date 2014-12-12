class Post < ActiveRecord::Base
	belongs_to :category
	mount_uploader :image, AttachmentUploader
	validates :name, presence: true
end
