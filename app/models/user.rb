class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :role, :status
  validates_presence_of :email, :name, :phone, :role

  has_many :tasks

  scope :active, -> { where(status: 'active') }

end
