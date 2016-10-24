class Equipment < ActiveRecord::Base
	validates :reference, presence: true
	validates :reference, uniqueness: true

	has_many :observations
end
