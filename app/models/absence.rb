class Absence < ActiveRecord::Base
  belongs_to :report
  belongs_to :worker

  validates :report_id, :report_id, presence: true
  

end
