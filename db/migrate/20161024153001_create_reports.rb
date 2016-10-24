class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :shift
      t.date :date
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
