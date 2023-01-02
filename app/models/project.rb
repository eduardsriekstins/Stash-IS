class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :orderables
  has_many :products, through: :orderables
end
