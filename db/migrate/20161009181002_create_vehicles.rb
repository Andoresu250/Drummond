class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :reference

      t.timestamps null: false
    end
    add_index :vehicles, :reference, unique: true
    #add_index :vehicles, :name, unique: true
  end
end
