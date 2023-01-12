class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  has_many :orderables
  has_many :projects, through: :orderables
  has_one :stock_item, dependent: :destroy
  accepts_nested_attributes_for :stock_item, update_only: true
  validates :model, presence: true
  validates :name, presence: true
  validates :manufacturer, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validate :validate_file_type
  
  def validate_file_type
    return unless image.attached?
    unless image.content_type.in?(%w[image/jpeg image jpg image/png])
      errors.add(:image, "Must be a JPEG, JPG or PNG")
    end
  end


  def create_stock_item
    self.stock_item ||= StockItem.new[product: self]
  end

  def image_resized
    image.variant(resize_to_limit: [300,260]).processed
  end

end
