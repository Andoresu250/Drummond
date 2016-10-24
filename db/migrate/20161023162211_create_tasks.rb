class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :equipment, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
