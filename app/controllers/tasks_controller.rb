class TasksController < ApplicationController

	before_filter :get_user
  before_filter :authenticate_user!, except: [:index, :show]

	def get_user
		@user = User.find(params[:user_id])
	end

  def index
  	@tasks = @user.tasks
  end

  def new
    if current_user.id.equal?(@user.id)
      @task = Task.new
    else
      flash[:error] = "Not authorized to create new Task for this User"
      redirect_to users_path
    end
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
