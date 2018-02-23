class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :content, null: false, default: ''
      t.boolean :done, null: false, default: false
      t.integer :priority
      t.date :deadline
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
