class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :role

  has_many :tasks

end
