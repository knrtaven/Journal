class AddDueToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :due, :datetime
  end
end
