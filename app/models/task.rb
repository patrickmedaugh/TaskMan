class Task < ActiveRecord::Base
  belongs_to :list

  validates :title, presence: true
  validate :dates_are_valid

  def dates_are_valid
    if start_date && due_date

    end
  end

end
