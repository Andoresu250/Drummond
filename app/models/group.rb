class Group < ActiveRecord::Base
  belongs_to :group_id
  has_many :has_workers
  has_many :workers, through: :has_workers
  after_create :save_workers

  validates :group_id_id, presence: true

  def workers=(value)
    @workers = value
  end

  def save_workers
    @workers.each do |worker_id|
      HasWorker.create(group_id: self.id, worker_id: worker_id)
    end
  end

end
