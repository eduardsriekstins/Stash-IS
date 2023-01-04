class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
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
end
