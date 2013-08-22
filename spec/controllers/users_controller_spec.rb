require 'spec_helper'

describe UsersController do


  describe "GET 'edit'" do
    before(:each) do
      @user = User.create
    end

    it "returns http success" do
      get 'edit', id: @user.id
      response.should be_success
    end

    it "renders the edit template" do
      get 'edit', id: @user.id
      expect(response).to render_template("edit")
    end

    it "assigns the requested user to @user" do
      get 'edit', id: @user.id
      expect(assigns(:user)).to eq(@user)
    end
  end


  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "renders the index template" do
      get 'index'
      expect(response).to render_template("index")
    end

    it "populates an array of users" do
      User.delete_all
      @user = User.create(status: "active")
      get 'index'
      expect(assigns(:users)).to eq([@user])
    end
  end


  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders the new template" do
      get 'new'
      expect(response).to render_template("new")
    end
  end


  describe "GET 'show'" do
    before(:each) do
      @user = User.create
    end

    it "returns http success" do
      get 'show', id: @user.id
      response.should be_success
    end
    it "renders the show template" do
      get 'show', id: @user.id
      expect(response).to render_template("show")
    end
    it "assigns the requested user to @user" do
      get 'show', id: @user.id
      expect(assigns(:user)).to eq(@user)
    end
  end


  describe "POST 'create'" do
    let(:user) {User.new}

    it "creates a new contact" do
      expect{
        post :create, user
      }.to change(User, :count).by(1)
      response.should redirect_to users_path
    end
  end

  describe "PUT 'update'" do
    let(:user) {User.create}

    it "changes users's attributes" do
      user.name = "Pepe"
      put 'update', id: user.id, user: {name: "#{user.name}"}
      user.reload
      user.name.should eq("Pepe")
    end

    it "redirecto to users_path" do
      put 'update', id: user.id
      response.should redirect_to users_path
    end

    it "locates the requested user" do
      put 'update', id: user.id
      assigns(:user).should eq(user)
    end
  end

end
