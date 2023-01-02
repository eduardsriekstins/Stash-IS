class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :project

  delegate :name, to: :product, prefix: true
end
