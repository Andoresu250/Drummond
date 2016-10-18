class RemoveReferenceFromVehicles < ActiveRecord::Migration
  def change
  	remove_column :vehicles, :reference, :integer
  end
end
