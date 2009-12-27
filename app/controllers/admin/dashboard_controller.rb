class Admin::DashboardController < ApplicationController
  layout "admin"
  #For Authentication
  before_filter :require_user
  #For Authorization
  filter_access_to :all
 
  def index
  end
  
  def browser
    @assets = Asset.all()
    @ckcallback = params[:CKEditorFuncNum]
    render :layout => false
  end
  
  def upload
  end
end