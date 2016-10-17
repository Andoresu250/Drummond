class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :permission_level, presence: true, numericality: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :worker

  include PermissionsConcern
end
