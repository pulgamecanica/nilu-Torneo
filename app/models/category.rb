class Category < ApplicationRecord
	has_many :matches
	has_many :players
end
