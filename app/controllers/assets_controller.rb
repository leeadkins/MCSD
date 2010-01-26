class AssetsController < ApplicationController
  # GET /assets
  # GET /assets.xml
  before_filter :get_event
  def index
    @assets = @event.assets.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assets }
    end
  end

  # GET /assets/1
  # GET /assets/1.xml
  def show
    @asset = @event.assets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asset }
    end
  end
  
  private
  def get_event
    @event = Event.find(params[:event_id])
  end
end
