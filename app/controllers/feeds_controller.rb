class FeedsController < ApplicationController
  
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new( feed_params )
    @feed.user = current_user
    if @feed.save
      redirect_to @feed
    else
      render 'new'
    end
  end

  def update
    @feed = Feed.find( params[:id] )
    if @feed.update_attributes( feed_params )
      redirect_to @feed
    else
      render 'edit'
    end
  end

  def edit
    @feed = Feed.find( params[:id] )
  end

  def destroy
    @feed = Feed.find( params[:id] )
    @feed.destroy
    redirect_to feeds_path
  end

  def index
    @feeds = Feed.all

  end

  def show
    @feed = Feed.find( params[:id] )

  end
  
  private
    def feed_params
      params.require(:feed).permit( :text )
    end
    
end
