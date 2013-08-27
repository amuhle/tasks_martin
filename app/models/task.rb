class Task < ActiveRecord::Base
  attr_accessible :description, :status, :time_to_finish, :title
  validates_presence_of :description, :status, :time_to_finish, :title, :user

  belongs_to :user

  STATUS = ['unstarted','started','finished']
end
