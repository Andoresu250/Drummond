class Report < ActiveRecord::Base
  belongs_to :group
  has_many :observations
  has_many :tasks
  has_many :shots
  has_many :vehicle_statuses
  after_create :save_observations
  after_create :save_tasks

  def observations=(value)
    @obs = value
  end

  def tasks=(value)
    @tasks = value
  end

  def save_observations
    @obs.each do |observation|
      Observation.create(observation.merge({:report_id => self.id}))
    end
  end

  def save_tasks
    @tasks.each do |task|
      Task.create(task.merge({:report_id => self.id}))
    end
  end

  def destroy_observations
    self.observations do |observation|
      observation.destroy
    end
  end

end
