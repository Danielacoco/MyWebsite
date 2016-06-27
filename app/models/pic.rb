class Pic < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, 
										:styles => { :medium => "700x700", :thumb => "100x100"}

	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
