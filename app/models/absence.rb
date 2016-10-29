class Absence < ActiveRecord::Base
  belongs_to :report
  belongs_to :worker
end
