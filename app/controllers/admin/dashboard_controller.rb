class Admin::DashboardController < ApplicationController
  layout "admin"
  before_filter :require_user
  
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