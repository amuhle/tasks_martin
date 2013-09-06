class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :phone, :role, :status, :photo
  validates_presence_of :email, :name, :phone, :role
  has_attached_file :avatar, :styles => { :small => "100x100>"}

  has_many :tasks

  scope :active, -> { where(status: 'active') }

end
