class RemoveReferenceFromEquipment < ActiveRecord::Migration
  def change
  	remove_column :equipment, :reference, :integer
  end
end
