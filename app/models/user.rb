class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :role, :status

  has_many :tasks

  scope :active, -> { where(status: 'active') }

end
