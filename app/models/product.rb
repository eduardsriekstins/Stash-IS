class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  has_many :orderables
  has_many :projects, through: :orderables
  has_one :stock_item
  accepts_nested_attributes_for :stock_item, update_only: true
  #after_initialize :create_stock_item

  def create_stock_item
    self.stock_item ||= StockItem.new[product: self]
  end
end
