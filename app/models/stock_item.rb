class StockItem < ApplicationRecord
  belongs_to :product
  validates :quantity_available, presence: true
end
