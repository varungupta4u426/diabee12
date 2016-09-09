class BlogPost < ApplicationRecord
	mount_uploader :data, VideoUploader
	validates :title, presence: true
	validates :subtitle, presence: true
	validates :url, presence: true, format: URI::regexp(%w(http https))
	validates :description, presence: true
	validates :patient_group_id, presence: true
	belongs_to :patient_group

	def content_type
		if data.content_type == "image/jpeg" || data.content_type == "image/png"
			"image"
		else
			"video"
		end
	end

	def has_asset?
		begin
			if !data.url.nil?
				true
			else
				false
			end
		rescue
			false
		end
	end

	def asset_name
		if has_asset?
			File.basename(data.path)
		else
			""
		end
	end
  def self.search(search)
    if search.blank?
      all
    else
      where('title LIKE ?', "%#{search}%" )
    end 
  end

end
