class RemoveNameFromEquipments < ActiveRecord::Migration
  def change
    remove_column :equipment, :name, :string
  end
end
