class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.references :equipment, index: true, foreign_key: true
      t.time :down
      t.time :ready
      t.text :comment

      t.timestamps null: false
    end
  end
end
