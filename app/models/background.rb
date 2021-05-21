class Background < ApplicationRecord
	has_one_attached :background_image
  validates_presence_of :name, :background_image

  scope :get_random_background, -> do
  	find(Background.pluck(:id).sample)
  end
end
