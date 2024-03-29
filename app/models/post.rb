class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 1500 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_rich_text :body
end
