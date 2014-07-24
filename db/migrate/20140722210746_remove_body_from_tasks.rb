class RemoveBodyFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :body
  end
end
