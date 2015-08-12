class Tag < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :task
end
