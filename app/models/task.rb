class Task < ActiveRecord::Base
  belongs_to :list

  validates :title, presence: true
  validates_with DateValidator

  def self.current
    where("start_date > ?", DateTime.now.to_date)
  end
end


