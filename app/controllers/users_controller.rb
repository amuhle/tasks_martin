class UsersController < ApplicationController
  def edit
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.create(params[:user])
  	redirect_to users_path
  end

  def update
  	@user = User.find(params[:id])
	@user.update_attributes(params[:user])
	redirect_to users_path
  end
end
