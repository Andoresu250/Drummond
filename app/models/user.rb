class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
=begin
  validates :email, presence: true
  validates :password, presence: true
  
=end
  validates :password_confirmation, presence: true
  validates :permission_level, presence: true, numericality: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_one :worker
  belongs_to :worker
  
  include PermissionsConcern
end
