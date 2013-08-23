require 'spec_helper'

describe TasksController do


  let!(:user){
    User.create(status: "active")
  }

  let!(:task) do
    tsk=Task.create
    user.tasks<<tsk
    tsk
  end


  describe "GET 'index'" do
    it "returns http success" do
      get 'index', user_id: user.id
      response.should be_success
    end

    it "renders the index template" do
      get 'index', user_id: user.id
      expect(response).to render_template("index")
    end

    it "populates an array of tasks" do
      user.tasks << task
      get 'index', user_id: user.id
      expect(assigns(:tasks)).to eq([task])
      expect(assigns(:user)).to eq(user)
    end
  end


  describe "GET 'new'" do
    it "returns http success" do
      get 'new', user_id: user.id
      response.should be_success
    end

    it "renders the new template" do
      get 'new', user_id: user.id
      expect(response).to render_template("new")
    end
  end


  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', user_id: user.id, id: task.id
      response.should be_success
    end

    it "renders the edit template" do
      get 'edit', user_id: user.id, id: task.id
      expect(response).to render_template("edit")
    end

    it "assigns the requested user to task" do
      get 'edit', user_id: user.id, id: task.id
      expect(assigns(:task)).to eq(task)
      expect(assigns(:user)).to eq(user)
    end
  end


  describe "GET 'show'" do
    it "returns http success" do
      get 'show', user_id: user.id, id: task.id
      response.should be_success
    end

    it "renders the show template" do
      get 'show', user_id: user.id, id: task.id
      expect(response).to render_template("show")
    end

    it "assigns the requested task to user and task" do
      get 'show', user_id: user.id, id: task.id
      expect(assigns(:task)).to eq(task)
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST 'create'" do
    let(:new_task) {Task.new(title: "titulo")}

    it "creates a new task" do
      expect{
        post :create, user_id: user.id, task: {title: "#{new_task.title}"}
      }.to change(user.tasks, :count).by(1)
      new_task = user.tasks.last
      response.should redirect_to user_task_path(user, new_task)
    end
  end


  describe "PUT 'update'" do
    it "changes task's attributes" do
      task.title = "titulo"
      put 'update', user_id: user.id, id: task.id, task:{title: "#{task.title}"}
      task.reload
      task.title.should eq("titulo")
    end

    it "redirecto to user_task_path" do
      put 'update', user_id: user.id, id: task.id
      response.should redirect_to user_task_path(user, task)
    end

    it "locates the requested task" do
      put 'update', user_id: user.id, id: task.id
      assigns(:task).should eq(task)
      assigns(:user).should eq(user)
    end
  end


end
