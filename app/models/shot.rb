class Shot < ActiveRecord::Base
  belongs_to :report

  validates :comment, :report_id, presence: true

end
