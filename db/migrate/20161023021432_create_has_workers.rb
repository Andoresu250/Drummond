class CreateHasWorkers < ActiveRecord::Migration
  def change
    create_table :has_workers do |t|
      t.references :worker, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
