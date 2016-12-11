class AddWorkingToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :working, :boolean, default: true
  end
end
