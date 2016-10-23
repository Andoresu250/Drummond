class HasWorker < ActiveRecord::Base
  belongs_to :worker
  belongs_to :group
end
