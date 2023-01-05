class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :orderables
  has_many :products, through: :orderables
  has_rich_text :description
  validates :status, inclusion: { in: [ 'to do', 'in progress', 'completed'] }
  STATUS_OPTIONS = [
    ['To Do', 'to do'],
    ['In Progress', 'in progress'],
    ['Completed', 'completed'],
  ]
  def badge_color
    case status
    when 'to do'
      'secondary'
    when 'in progress'
      'info'
    when 'completed'
      'success'
    end
  end

  def self.total_project_cost(project)
    total_price = 0.00
    project.orderables.each do |orderable|
      total_price = total_price + orderable.quantity * orderable.product.price.to_f
    end
    total_price
  end

end
