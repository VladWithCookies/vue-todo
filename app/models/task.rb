class Task < ApplicationRecord
  belongs_to :project

  validates :content, presence: true

  before_save :assing_priority

  private

  def assing_priority
    self.priority = (Task.count + 1) * 1000
  end
end
