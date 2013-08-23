class UsersController < ApplicationController
  def edit
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.active
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


  def delete_status
    user = User.find(params[:id])
    user.status = "inactive"
    respond_to do |format|
      if user.save
        format.json { render json: {status: "saved"} }
      else
        format.json render json: {status: "unsaved"}
      end
    end
  end

end
