class VehicleStatus < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :report
end
