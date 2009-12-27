class Admin::DashboardController < ApplicationController
  layout "admin"
  
  skip_before_filter :verify_authenticity_token, :only => :upload
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
  
  def individual
    @asset = Asset.find(params[:id])
    @ckcallback = params[:callback]
    render :layout => false
  end
  
  def upload
    if !params[:upload].blank?
      callback = params[:CKEditorFuncNum]
      image = params[:upload]
      name = params[:upload].original_filename
      @asset = Asset.new
      @asset.file = image
      @asset.name = name
      respond_to do |format|
        if @asset.save
          js = "window.parent.CKEDITOR.tools.callFunction('#{callback}', '#{@asset.file.url}', '');"
          flash[:notice] = 'Asset was successfully created.'
          format.html { render :js => '<html><script type="text/javascript">' + js +'</script></html>'  }
          format.xml  { render :xml => @asset, :status => :created, :location => @asset }
        else
          js = "window.parent.CKEDITOR.tools.callFunction('#{callback}','','Invalid File');"
          format.html { render :js => '<html><script type="text/javascript">' + js +'</script></html>' }
          format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
        end
      end
    else
      js = "window.parent.CKEDITOR.tools.callFunction('#{callback}','','Invalid File');"
      render :js => '<html><script type="text/javascript">' + js +'</script></html>'
    end
  end
end