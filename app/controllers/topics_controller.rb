class TopicsController < ApplicationController

    before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

    def new
      @topic = Topic.new
    end

    def create
      @topic = Topic.new( topic_params )
      @topic.user = current_user
      if @topic.save
        redirect_to @topic
      else
        render 'new'
      end
    end

    def update
      @topic = Topic.find( params[:id] )
      if @topic.update_attributes( topic_params )
        redirect_to @topic
      else
        render 'edit'
      end
    end

    def edit
      @topic = Topic.find( params[:id] )
    end

    def destroy
      @topic = Topic.find( params[:id] )
      @topic.destroy
      redirect_to topics_path
    end

    def index
      @topics = Topic.order( 'created_at DESC' ).limit( @topics_per_page )

    end

    def show
      @topic = Topic.find( params[:id] )

    end

    private
      def topic_params
        params.require(:topic).permit( :title, :description )
      end

end
