class Category < ApplicationRecord
  has_one_attached :image
  has_many :products, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validate :validate_file_type

  def validate_file_type
    return unless image.attached?
    unless image.content_type.in?(%w[image/jpeg image jpg image/png])
      errors.add(:image, "Must be a JPEG, JPG or PNG")
    end
  end


  def image_resized2
    image.variant(resize_to_limit: [300,260]).processed
  end

end
