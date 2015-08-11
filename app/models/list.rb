class List < ActiveRecord::Base
  has_many :tasks

  validates :title, presence: true

  def active
    tasks.where("status = 'incomplete' AND start_date <= ? AND list_id = ?", DateTime.now.to_date, self.id)
  end

  def scheduled
    tasks.where("status = 'incomplete' AND start_date > ? AND list_id = ?", DateTime.now.to_date, self.id)
  end
end
