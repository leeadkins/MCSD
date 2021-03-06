class Admin::AssetsController < ApplicationController
  layout "subpage"
  #For Authentication
  before_filter :require_user
  before_filter :prep_mobile
  #For Authorization
  filter_resource_access
  
 
  # GET /assets
   # GET /assets.xml
   def index
     @assets = Asset.all

     respond_to do |format|
       format.mobile
       format.html # index.html.erb
       format.xml  { render :xml => @assets }
       format.json { render :json => @assets }
     end
   end

   # GET /assets/1
   # GET /assets/1.xml
   def show
     @asset = Asset.find(params[:id])

     respond_to do |format|
       format.mobile
       format.html # show.html.erb
       format.xml  { render :xml => @asset }
     end
   end

   # GET /assets/new
   # GET /assets/new.xml
   def new
     @asset = Asset.new

     respond_to do |format|
       format.mobile
       format.html # new.html.erb
       format.xml  { render :xml => @asset }
     end
   end

   # GET /assets/1/edit
   def edit
     @asset = Asset.find(params[:id])
   end

   # POST /assets
   # POST /assets.xml
   def create
     @asset = Asset.new(params[:asset])

     respond_to do |format|
       if @asset.save
         
         flash[:notice] = 'Asset was successfully created.'
         format.mobile { redirect_to(admin_asset_url(@asset)) }
         
         format.html { redirect_to(admin_asset_url(@asset)) }
         format.xml  { render :xml => @asset, :status => :created, :location => @asset }
       else
         format.mobile { render :action => "new" }
         format.html { render :action => "new" }
         format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
       end
     end
   end

   # PUT /assets/1
   # PUT /assets/1.xml
   def update
     @asset = Asset.find(params[:id])

     respond_to do |format|
       if @asset.update_attributes(params[:asset])
         flash[:notice] = 'Asset was successfully updated.'
         format.mobile { redirect_to(admin_asset_url(@asset)) }
         format.html { redirect_to(admin_asset_url(@asset)) }
         format.xml  { head :ok }
       else
           format.mobile { render :action => "edit" }
         format.html { render :action => "edit" }
         format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /assets/1
   # DELETE /assets/1.xml
   def destroy
     @asset = Asset.find(params[:id])
     @asset.destroy

     respond_to do |format|
       format.mobile { redirect_to(admin_assets_url) }
       format.html { redirect_to(admin_assets_url) }
       format.xml  { head :ok }
     end
   end
end
