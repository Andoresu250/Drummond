class AddCreatedByIdFromReports < ActiveRecord::Migration
  def change
    add_column :reports, :created_by_id, :integer
  end
end
