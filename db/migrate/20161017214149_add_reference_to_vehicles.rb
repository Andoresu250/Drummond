class AddReferenceToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :reference, :string
  end
end
