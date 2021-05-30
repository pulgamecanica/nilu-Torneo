class Category < ApplicationRecord
	has_many :matches
	has_many :players
  has_many :suggestion, as: :suggestable
	has_one_attached :category_image
  validates_presence_of :title, :min_rank, :max_rank
  validates_length_of :description, within: 10..350
  scope :active_categories, -> do
		where(active: true)
  end
  scope :order_by_rank, -> do
		order(:min_rank)
  end
end
