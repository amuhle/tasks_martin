class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :role, :status

  has_many :tasks

  scope :active, -> { where(status: 'active') }

  after_create :default_active

  def default_active
  	self.status = "active"
  	self.save!
  end

end
