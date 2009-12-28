class OffendersController < ApplicationController
  def index
    @posts = Post.published.all(:order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end
end
