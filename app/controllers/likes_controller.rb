class LikesController < ApplicationController
  before_action :set_article

  def create
    if current_user.has_liked?(@article)
      render json: { error: 'Already liked' }, status: :unprocessable_entity
    else
      @like = @article.likes.build(user: current_user)
      if @like.save
        render json: { status: 'liked' }
      else
        render json: { error: 'Failed to like' }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @like = @article.likes.find_by(user_id: current_user.id)
    if @like&.destroy
      render json: { status: 'unliked' }
    else
      render json: { error: 'Failed to unlike' }, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end
