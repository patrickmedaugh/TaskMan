class Task < ActiveRecord::Base
  belongs_to :list
  has_many :tags

  validates :title, presence: true
  validates_with DateValidator
end


