class PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end
  
  #GET /<slug>
  #GET /<slug>.xml
  def slugged_get
    @page = Page.find_by_slug(params[:slug])
    unless @page
      render_404
    else
      respond_to do |format|
        format.html {render :action => :show}
        format.xml { render :xml => @page }
      end
    end
  end
  
  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end
end
