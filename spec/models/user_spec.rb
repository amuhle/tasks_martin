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
  	user_active = User.create(email: "email", name: "name", phone: 123, role: "role")
  	User.active.should include(user_active)

  	user_inactive = User.create(email: "email1", name: "name1", phone: 123, role: "role1")
    user_inactive.status = "inactive"
    user_inactive.save
  	User.active.should_not include(user_inactive)
	end

  it "should validate presence of" do
    @user.should have(1).error_on(:email)
    @user.should have(1).error_on(:name)
    @user.should have(1).error_on(:phone)
    @user.should have(1).error_on(:role)
  end
end
