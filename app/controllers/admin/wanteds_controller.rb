class Admin::WantedsController < ApplicationController
  #For Authentication
  before_filter :require_user
  before_filter :prep_mobile
  #For Authorization
  filter_resource_access
  filter_access_to :sort
  # GET /wanteds
  # GET /wanteds.xml
  layout "subpage"
  def index
    @wanteds = Wanted.all(:order => "rank")

    respond_to do |format|
      format.mobile
      format.html # index.html.erb
      format.xml  { render :xml => @wanteds }
    end
  end

  # GET /wanteds/1
  # GET /wanteds/1.xml
  def show
    @wanted = Wanted.find(params[:id])

    respond_to do |format|
      format.mobile
      format.html # show.html.erb
      format.xml  { render :xml => @wanted }
    end
  end

  # GET /wanteds/new
  # GET /wanteds/new.xml
  def new
    @wanted = Wanted.new

    respond_to do |format|
      format.mobile
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
        format.mobile { redirect_to(admin_wanted_path(@wanted)) }
        format.html { redirect_to(admin_wanted_path(@wanted)) }
        format.xml  { render :xml => @wanted, :status => :created, :location => @wanted }
      else
        format.mobile { render :action => "new" }
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
        format.mobile { redirect_to(admin_wanted_path(@wanted)) }
        format.html { redirect_to(admin_wanted_path(@wanted)) }
        format.xml  { head :ok }
      else
        format.mobile { render :action => "edit" }
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
      format.mobile { redirect_to(wanteds_url) }
      format.html { redirect_to(wanteds_url) }
      format.xml  { head :ok }
    end
  end
  def sort
    params[:wanted].each_with_index do |id, index|
      Wanted.update_all(['rank=?', index+1], ['id=?', id])
    end
    render :text => "test" 
  end
end
