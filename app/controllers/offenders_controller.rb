class OffendersController < ApplicationController
  # GET /offenders
  # GET /offenders.xml
  def index
    @offenders = Offender.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @offenders }
    end
  end

  # GET /offenders/1
  # GET /offenders/1.xml
  def show
    @offender = Offender.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offender }
    end
  end
end
