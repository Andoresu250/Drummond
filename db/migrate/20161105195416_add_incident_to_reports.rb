class AddIncidentToReports < ActiveRecord::Migration
  def change
    add_column :reports, :incident, :boolean, default: false
    add_column :reports, :incident_comment, :text, default: ""
  end
end
