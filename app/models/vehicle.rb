class Vehicle < ActiveRecord::Base
	validates :reference, presence: true
	validates :reference, uniqueness: true

	has_many :vehicle_statuses

end
