require 'spec_helper'


describe User do

	before(:each) do
    @user = User.new
  end

  it "respond to email, name, phone, role, status and relationship" do
  	@user.should respond_to(:email)
  	@user.should respond_to(:name)
  	@user.should respond_to(:phone)
  	@user.should respond_to(:role)
  	@user.should respond_to(:status)
  end

  it "relationship has many tasks" do
  	@user.should have_many(:tasks)
  end

  it "test scopes" do
  	user_active = User.create()
  	User.active.should include(user_active)

  	user_inactive = User.create()
    user_inactive.status = "inactive"
    user_inactive.save
  	User.active.should_not include(user_inactive)
	end
end
