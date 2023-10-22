class ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile

    def index
        @articles = Article.order(created_at: :desc) #記事を作成降順に取得
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