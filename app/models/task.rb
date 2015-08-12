class Task < ActiveRecord::Base
  belongs_to :list

  validates :title, presence: true
  validates_with DateValidator
end


