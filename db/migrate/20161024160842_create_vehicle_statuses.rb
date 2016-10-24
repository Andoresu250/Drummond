class CreateVehicleStatuses < ActiveRecord::Migration
  def change
    create_table :vehicle_statuses do |t|
      t.references :vehicle, index: true, foreign_key: true
      t.string :status
      t.string :location

      t.timestamps null: false
    end
  end
end
