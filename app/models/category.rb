class Category < ApplicationRecord
	has_many :matches
	has_many :players
	has_one_attached :category_image
end
