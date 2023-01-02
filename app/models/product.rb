class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  has_many :orderables
  has_many :projects, through: :orderables
end
