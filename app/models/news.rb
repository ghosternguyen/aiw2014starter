class News < ActiveRecord::Base
	mount_uploader :image, AttachmentUploader
end
