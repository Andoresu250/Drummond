class AddReferenceToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :reference, :string
  end
end
