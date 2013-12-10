class FeedsController < ApplicationController
  
  before_action :authenticate_user!
  
   def create
      @topic = Topic.find(params[:topic_id])
      @feed = @topic.feeds.create(params[:feed].permit(:feeder, :text))
      @feed.user = current_user
      @feed.save

      respond_to do |format|
        format.js 
        format.html { 
          redirect_to topic_path(@topic) 
        }
      end
    end

    def destroy
      @topic = Topic.find(params[:topic_id])
      @feed = @topic.feeds.find(params[:id])
      @feed.destroy

      respond_to do |format|
        format.js
        format.html { 
          redirect_to topic_path(@topic)
        }
      end
    end

  end
  
  # def new
  #     @feed = Feed.new
  #   end
  # 
  #   def create
  #     @feed = Feed.new( feed_params )
  #     @feed.user = current_user
  #     if @feed.save
  #       redirect_to @feed
  #     else
  #       render 'new'
  #     end
  #   end
  # 
  #   def update
  #     @feed = Feed.find( params[:id] )
  #     if @feed.update_attributes( feed_params )
  #       redirect_to @feed
  #     else
  #       render 'edit'
  #     end
  #   end
  # 
  #   def edit
  #     @feed = Feed.find( params[:id] )
  #   end
  # 
  #   def destroy
  #     @feed = Feed.find( params[:id] )
  #     @feed.destroy
  #     redirect_to feeds_path
  #   end
  # 
  #   def index
  #     @feeds = Feed.all
  # 
  #   end
  # 
  #   def show
  #     @feed = Feed.find( params[:id] )
  # 
  #   end
  #   
  #   private
  #     def feed_params
  #       params.require(:feed).permit( :text )
  #     end
