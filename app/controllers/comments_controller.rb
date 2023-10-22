class CommentsController < ApplicationController
    before_action :set_article
  
    def index
        @article = Article.find(params[:article_id])
        @comments = @article.comments.order(created_at: :desc)
        @comment = Comment.new
    end
    
  
    def create
      @comment = @article.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        render json: { comment: @comment, message: 'コメントを投稿しました' }, status: :created
      else
        render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_article
      @article = Article.find(params[:article_id])
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  