class BlogPost < ApplicationRecord

	mount_uploader :data, BlogUploader
end
