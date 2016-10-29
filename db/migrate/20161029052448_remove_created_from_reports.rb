class RemoveCreatedFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :created, :integer
  end
end
