require 'spec_helper'

describe Task do

	before(:each) do
    @task = Task.new
  end

  it "respond to description, status, phone, time_to_finish and title" do
  	@task.should respond_to(:description)
  	@task.should respond_to(:status)
  	@task.should respond_to(:time_to_finish)
  	@task.should respond_to(:title)
  end

  it "relationship belongs to tasks" do
  	@task.should belong_to(:user)
  end

  it "should validate presence of" do
    @task.should have(1).error_on(:description)
    @task.should have(1).error_on(:status)
    @task.should have(1).error_on(:time_to_finish)
    @task.should have(1).error_on(:title)
    @task.should have(1).error_on(:user)
  end
end
