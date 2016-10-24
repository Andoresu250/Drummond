class Observation < ActiveRecord::Base
  belongs_to :equipment

  validates :equipment_id, presence: true
  validates :comment, presence: true

end
