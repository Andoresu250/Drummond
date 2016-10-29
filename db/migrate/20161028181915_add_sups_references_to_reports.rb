class AddSupsReferencesToReports < ActiveRecord::Migration
  def change
    add_column :reports, :senior_id, :integer, default: nil
    add_column :reports, :junior_id, :integer, default: nil
    add_column :reports, :created, :integer, default: nil
  end
end
