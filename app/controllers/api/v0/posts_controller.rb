class Api::V0::PostsController < ApplicationController
    def index
      @user = User.find(params[:user_id])
      @posts = @user.posts
  
      respond_to do |format|
        format.json { render json: @posts }
      end
    end
  end