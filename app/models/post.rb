class Post < ApplicationRecord
	has_one_attached :post_image
	validates_presence_of :title, :description
end
