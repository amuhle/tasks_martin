class Task < ActiveRecord::Base
  attr_accessible :description, :status, :time_to_finish, :title, :created_at
  validates_presence_of :description, :status, :time_to_finish, :title, :user

  belongs_to :user

  STATUS = ['unstarted','started','finished']

=begin
  after_create :trunc_date

  def trunc_date
  	date = DateTime.new(self.created_at.year, self.created_at.month, self.created_at.day, 0, 0, 0)
  	self.created_at = date
  	self.save
  end
=end
end
