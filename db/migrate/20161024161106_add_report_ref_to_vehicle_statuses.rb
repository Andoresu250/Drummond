class AddReportRefToVehicleStatuses < ActiveRecord::Migration
  def change
    add_reference :vehicle_statuses, :report, index: true, foreign_key: true
  end
end
