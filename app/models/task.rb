class Task < ActiveRecord::Base
  attr_accessible :description, :status, :time_to_finish, :title

  belongs_to :user

  STATUS = ['unstarted','started','finished']
end
