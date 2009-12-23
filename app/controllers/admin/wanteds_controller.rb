class Admin::WantedsController < ApplicationController
  # GET /wanteds
  # GET /wanteds.xml
  layout "subpage"
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

  # GET /wanteds/new
  # GET /wanteds/new.xml
  def new
    @wanted = Wanted.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wanted }
    end
  end

  # GET /wanteds/1/edit
  def edit
    @wanted = Wanted.find(params[:id])
  end

  # POST /wanteds
  # POST /wanteds.xml
  def create
    @wanted = Wanted.new(params[:wanted])

    respond_to do |format|
      if @wanted.save
        flash[:notice] = 'Wanted was successfully created.'
        format.html { redirect_to(@wanted) }
        format.xml  { render :xml => @wanted, :status => :created, :location => @wanted }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wanted.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wanteds/1
  # PUT /wanteds/1.xml
  def update
    @wanted = Wanted.find(params[:id])

    respond_to do |format|
      if @wanted.update_attributes(params[:wanted])
        flash[:notice] = 'Wanted was successfully updated.'
        format.html { redirect_to(@wanted) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wanted.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wanteds/1
  # DELETE /wanteds/1.xml
  def destroy
    @wanted = Wanted.find(params[:id])
    @wanted.destroy

    respond_to do |format|
      format.html { redirect_to(wanteds_url) }
      format.xml  { head :ok }
    end
  end
end
