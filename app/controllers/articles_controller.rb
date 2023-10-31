class ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile

    def index
        following_articles = Article.where(user_id: current_user.following.pluck(:id)).order(created_at: :desc)
        popular_articles = Article.in_last_24_hours.popular.limit(5)
    
        @articles = (following_articles + popular_articles).uniq.sort_by { |article| article[:created_at] }.reverse
    end

    def show
        @article = Article.find(params[:id])
        @comments = @article.comments.order(created_at: :desc)
        @comment = @article.comments.new
    end


    def new
        @article = Article.new
    end

    def create
        puts params
        @article = current_user.articles.build(article_params)
    
        if @article.save!
            render json: { message: '記事を投稿しました', article: @article }, status: :created
        else
            render json: { message: '記事の投稿に失敗しました', errors: @article.errors }, status: :unprocessable_entity
        end
    end

    private

    def article_params
        params.require(:article).permit(:content, images: [])
    end

	def set_profile
        @profile = current_user.profile
    end

end