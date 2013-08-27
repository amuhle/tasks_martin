class TasksController < ApplicationController

	before_filter :get_user

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
  	@task = @user.tasks.find(params[:id])

  end

  def update
  	@task = @user.tasks.find(params[:id])
  	@task.assign_attributes(params[:task])
    if @task.changed? & @task.save
      flash[:success] = "Task was successfully edited."
      redirect_to [@user, @task]
    else
      flash[:error] = "You must change at least one parameter"
      render 'edit'
    end
  end

  def create
    @task = Task.new(params[:task])
    @user.tasks << @task
    if @task.save
      @user.tasks << @task
      flash[:success] = "Task was successfully created."
      redirect_to [@user, @task]
    else
      render 'new'
    end
  end

  def show
  	@task = @user.tasks.find(params[:id])
  end
end
