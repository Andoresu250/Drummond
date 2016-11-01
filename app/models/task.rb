class Task < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :report

  validates :equipment_id, :report_id, :comment , presence: true

end
