class ChangeDateFormatInTasks < ActiveRecord::Migration
  def up
    change_column :tasks, :start_date, :date
    change_column :tasks, :due_date, :date
  end

  def down
    change_column :tasks, :start_date, :datetime
    change_column :tasks, :due_date, :datetime
  end
end
