class CommentsController < ApplicationController
    before_action :set_article
  
    def index
        @comments = @article.comments.order(created_at: :desc)
        render json: @comments
    end
      

  
    def create
        @comment = @article.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save
          render json: @comment
        else
          render json: { errors: @comment.errors.full_messages }
        end
    end
      
    def destroy
      @comment = @article.comments.find_by(id: params[:id])
      @comment.destroy if @comment.user == current_user
      redirect_to article_path(@article), notice: 'コメントが削除されました。'
  end

    private
  
    def set_article
      @article = Article.find(params[:article_id])
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  