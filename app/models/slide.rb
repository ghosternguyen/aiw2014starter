class Slide < ActiveRecord::Base
	IMAGE_SIZES = {
		:default => [770, 436],
		:mini => [770, 436],
		:thumb => [228, 180]
	}

	mount_uploader :photo, AttachmentUploader
end
