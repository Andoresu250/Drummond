class Report < ActiveRecord::Base
  belongs_to :group
  belongs_to :senior, class_name: "Worker"
  belongs_to :junior, class_name: "Worker"
  belongs_to :created_by, class_name: "Worker"
  has_many :observations
  has_many :tasks
  has_many :shots
  has_many :vehicle_statuses
  has_many :absences
  after_create :save_observations
  after_create :save_tasks
  after_create :save_shots
  after_create :save_vehicle_statuses
  after_create :save_absences
  after_update :save_observations
  after_update :save_tasks
  after_update :save_shots
  after_update :update_vehicle_statuses

  def observations=(value)
    @obs = value
  end

  def tasks=(value)
    @tasks = value
  end

  def shots=(value)
    @shots = value
  end

  def vehicle_statuses=(value)
    @vs = value
  end

  def absences=(value)
    @absences = value
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

  def save_shots
    @shots.each do |shot|
      Shot.create(shot.merge({:report_id => self.id}))
    end
  end

  def save_vehicle_statuses
    @vs.each do |v|
      VehicleStatus.create(v.merge({:report_id => self.id}))
      vehicle = Vehicle.find_by(id: v[:vehicle_id])
      vehicle.update(current_status: v[:status])
    end
  end

  def save_absences
    @absences.each do |absence|
      Absence.create(absence.merge({:report_id => self.id}))
    end
  end

  def update_vehicle_statuses
    @vs.each do |v|
      vehicle_status = VehicleStatus.find_by(:report_id => self.id, :vehicle_id => v[:vehicle_id])
      vehicle_status.update(v)
      vehicle = Vehicle.find_by(id: v[:vehicle_id])
      vehicle.update(current_status: v[:status])
    end
  end

  def destroy_observations
    self.observations do |observation|
      observation.destroy
    end
  end

end
