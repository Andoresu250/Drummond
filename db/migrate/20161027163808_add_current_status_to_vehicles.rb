class AddCurrentStatusToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :current_status, :string, default: "ok"
  end
end
