class TasksController < ApplicationController

	before_filter :get_user, :only => [:index, :show, :create, :edit, :update, :new]

	def get_user
		@user = User.find(params[:user_id])
	end

  def index
  	@tasks = @user.tasks
  end

  def new
  	@task = Task.new
  end

  def edit
  	@task = Task.find(params[:id])
  end

  def update
  	@task = Task.find(params[:id])
  	@task.update_attributes(params[:task])
    redirect_to [@user, @task]
  end

  def create
  	@task = Task.create(params[:task])
  	@user.tasks << @task
  	redirect_to [@user, @task]
  end

  def show
  	@task = @user.tasks.find(params[:id])
  end
end
