class Admin::OffendersController < ApplicationController
  layout "subpage"
  before_filter :prep_mobile

  #For Authentication  
  before_filter :require_user
 #For Authorization
  filter_resource_access
  # GET /offenders
  # GET /offenders.xml
  def index
    @offenders = Offender.all(:order => "lastname")
    respond_to do |format|
      format.mobile
      format.html # index.html.erb
      format.xml  { render :xml => @offenders }
    end
  end

  # GET /offenders/1
  # GET /offenders/1.xml
  def show
    @offender = Offender.find(params[:id])

    respond_to do |format|
      format.mobile
      format.html # show.html.erb
      format.xml  { render :xml => @offender }
    end
  end

  # GET /offenders/new
  # GET /offenders/new.xml
  def new
    @offender = Offender.new

    respond_to do |format|
      format.mobile
      format.html # new.html.erb
      format.xml  { render :xml => @offender }
    end
  end

  # GET /offenders/1/edit
  def edit
    @offender = Offender.find(params[:id])
  end

  # POST /offenders
  # POST /offenders.xml
  def create
    @offender = Offender.new(params[:offender])

    respond_to do |format|
      if @offender.save
        flash[:notice] = 'Offender was successfully created.'
        format.mobile { redirect_to(admin_offender_path(@offender)) }
        format.html { redirect_to(admin_offender_path(@offender)) }
        format.xml  { render :xml => @offender, :status => :created, :location => @offender }
      else
        format.mobile{ render :action => "new" }
        format.html { render :action => "new" }
        format.xml  { render :xml => @offender.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /offenders/1
  # PUT /offenders/1.xml
  def update
    @offender = Offender.find(params[:id])

    respond_to do |format|
      if @offender.update_attributes(params[:offender])
        flash[:notice] = 'Offender was successfully updated.'
      format.mobile { redirect_to(admin_offender_path(@offender)) }
        format.html { redirect_to(admin_offender_path(@offender)) }
        format.xml  { head :ok }
      else
       format.mobile { render :action => "edit" }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offender.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /offenders/1
  # DELETE /offenders/1.xml
  def destroy
    @offender = Offender.find(params[:id])
    @offender.destroy

    respond_to do |format|
      format.mobile { redirect_to(admin_offenders_url) }
      format.html { redirect_to(admin_offenders_url) }
      format.xml  { head :ok }
    end
  end
end
