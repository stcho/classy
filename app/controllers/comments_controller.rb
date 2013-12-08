class CommentsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
  end

  def create
    @feed = Feed.find(params[:feed_id])
    @comment = @feed.comments.create(params[:comment].permit(:commenter, :body))
    @comment.user = current_user
    @comment.save
    
    respond_to do |format|
      format.js 
      format.html { 
        redirect_to feed_path(@feed) 
      }
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @feed = Feed.find(params[:feed_id])
    @comment = @feed.comments.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      format.js
      format.html { 
        redirect_to feed_path(@feed)
      }
    end
  end

  def index
  end

  def show
  end
  
end
