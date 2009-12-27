class Admin::UsersController < ApplicationController
  #For Authentication
  before_filter :require_user
  #For Authorization
  filter_resource_access
  layout "subpage"
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def new
    @user = User.new
  end
  
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User Creation Successful."
      redirect_to admin_users_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile"
      redirect_to admin_users_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      flash[:notice] = "You can't delete yourself."
      redirect_to admin_users_url
    else
      @user.destroy
      respond_to do |format|
        format.html { redirect_to(admin_users_url) }
        format.xml  { head :ok }
      end
    end
  end
end
