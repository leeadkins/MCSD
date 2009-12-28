class Admin::OffendersController < ApplicationController
  #For Authentication
  before_filter :require_user
  #For Authorization
  filter_resource_access
  
  layout "subpage"
  # GET /assets
   # GET /assets.xml
   def index
     @offenders = Offender.all
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @offenders }
       format.json { render :json => @offenders }
     end
   end

   # GET /assets/1
   # GET /assets/1.xml
   def show
     @offender = Offender.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @offender }
     end
   end

   # GET /assets/new
   # GET /assets/new.xml
   def new
     @offender = Offenders.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @offender }
     end
   end

   # GET /assets/1/edit
   def edit
     @offender = Offender.find(params[:id])
   end

   # POST /assets
   # POST /assets.xml
   def create
     @offender = Offender.new(params[:offender])

     respond_to do |format|
       if @offender.save
         flash[:notice] = 'Offender was successfully created.'
         format.html { redirect_to(admin_offender_url(@offender)) }
         format.xml  { render :xml => @offender, :status => :created, :location => @offender }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @offender.errors, :status => :unprocessable_entity }
       end
     end
   end

   # PUT /assets/1
   # PUT /assets/1.xml
   def update
     @offender = Offender.find(params[:id])

     respond_to do |format|
       if @offender.update_attributes(params[:offender])
         flash[:notice] = 'Offender was successfully updated.'
         format.html { redirect_to(admin_offender_url(@offender)) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @offender.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /assets/1
   # DELETE /assets/1.xml
   def destroy
     @offender = Offender.find(params[:id])
     @offender.destroy

     respond_to do |format|
       format.html { redirect_to(admin_offender_url) }
       format.xml  { head :ok }
     end
   end
end
