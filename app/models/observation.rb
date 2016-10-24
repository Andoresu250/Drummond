class Observation < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :report

  validates :equipment_id, presence: true
  validates :comment, presence: true

end
