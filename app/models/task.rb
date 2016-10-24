class Task < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :report
end
