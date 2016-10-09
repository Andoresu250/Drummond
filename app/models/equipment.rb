class Equipment < ActiveRecord::Base
	validates :name, presence: true
	validates :reference, presence: true
	validates :reference, uniqueness: true
	validates :reference, :numericality => {:only_integer => true}
end
