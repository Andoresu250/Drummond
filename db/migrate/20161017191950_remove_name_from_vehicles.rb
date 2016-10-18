class RemoveNameFromVehicles < ActiveRecord::Migration
  def change
    remove_column :vehicles, :name, :string
  end
end
