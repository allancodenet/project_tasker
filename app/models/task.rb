class Task < ApplicationRecord
  belongs_to :project
  enum :priority, {high: 0, medium: 1, low: 2}
  after_update :update_completed_at

  def update_completed_at
    if completed?
      update_column(:completed_at, Time.current)
    else
      update_column(:completed_at, nil)
    end
  end
end
