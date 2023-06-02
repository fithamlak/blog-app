class Api::V0::CommentsController < Api::V0::BaseController
    def index
      post = Post.find(params[:post_id])
      @comments = Comment.where(post:)
  
      render json: @comments
    end
  
    def create
      @comment = Comment.new(comment_params)
      @comment.author = current_user
  
      if @comment.save
        render json: @comment, status: :created, location: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:post_id, :text, :author_id)
    end
  end