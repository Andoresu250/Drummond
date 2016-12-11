class AddWorkingToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :working, :boolean, default: true
  end
end
