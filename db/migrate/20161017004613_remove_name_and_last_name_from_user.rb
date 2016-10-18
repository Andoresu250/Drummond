class RemoveNameAndLastNameFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :name
  	remove_column :users, :last_name
  end
end
