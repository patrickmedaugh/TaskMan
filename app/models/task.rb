class Task < ActiveRecord::Base
  belongs_to :list

  validates :title, presence: true
  validates_with DateValidator

  def self.active
    where("status = 'incomplete' AND start_date <= ?", DateTime.now.to_date)
  end
end


