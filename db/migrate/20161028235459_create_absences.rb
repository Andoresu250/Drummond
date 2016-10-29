class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.references :report, index: true, foreign_key: true
      t.references :worker, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
