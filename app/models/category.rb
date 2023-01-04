class Category < ApplicationRecord
  has_one_attached :image
  has_many :products, dependent: :destroy

  def image_resized2
    image.variant(resize_to_limit: [300,260]).processed
  end

end
