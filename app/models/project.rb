class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :orderables
  has_many :products, through: :orderables
  has_rich_text :description
  has_one_attached :agreement, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :deadline, presence: true
  validates :agreement, presence: true
  validate :validate_file_type
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

  def validate_file_type
    return unless agreement.attached?
    unless agreement.content_type.in?(%w[application/pdf])
      errors.add(:agreement, "Must be a PDF")
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
