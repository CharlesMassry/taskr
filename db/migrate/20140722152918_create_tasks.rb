class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.belongs_to :user, index: true, null: false
      t.boolean :done, null: false, default: false

      t.timestamps
    end
  end
end
