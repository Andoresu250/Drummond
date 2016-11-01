class VehicleStatus < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :report

  validates :vehicle_id, :report_id, :status, presence: true

end
