class WantedsController < ApplicationController
  # GET /wanteds
  # GET /wanteds.xml
  def index
    @wanteds = Wanted.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wanteds }
    end
  end

  # GET /wanteds/1
  # GET /wanteds/1.xml
  def show
    @wanted = Wanted.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wanted }
    end
  end
end
