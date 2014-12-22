class News < ActiveRecord::Base
	IMAGE_SIZES = {
		:default => [800, 800],
		:mini => [270, 190],
		:thumb => [170, 100]
	}
	mount_uploader :image, AttachmentUploader
end
