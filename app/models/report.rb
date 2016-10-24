class Report < ActiveRecord::Base
  belongs_to :group
  has_many :observations
  has_many :tasks
  has_many :shots
  has_many :vehicle_statuses
end
