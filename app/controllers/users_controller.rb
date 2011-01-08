class UsersController < ApplicationController
  respond_to :html, :json
  
  def index
    @users = User.all
    respond_with(@users)
  end
  
  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    flash[:notice] = 'User was successfully created.' if @user.save
    respond_with(@user)
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = 'User was successfully updated.' if @user.update_attributes(params[:user])
    respond_with(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_with(@user)
  end
end