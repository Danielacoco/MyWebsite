class Pic < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, 
										:styles => { :medium => "700x700", :thumb => "300x300"}

	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	validates :image, presence: true
	validates :description, presence: true

	has_many :comments, as: :commentable 
end
