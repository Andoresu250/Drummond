class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.text :comment

      t.timestamps null: false
    end
  end
end
