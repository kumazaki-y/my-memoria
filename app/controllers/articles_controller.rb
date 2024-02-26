class ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile

    def index
        # フォローしているユーザーと自分自身の投稿を取得
        following_and_own_articles = Article.where(user_id: current_user.following.pluck(:id) << current_user.id).order(created_at: :desc)
        
        # 24時間以内に作成され、いいねが多い投稿を5件取得
        popular_articles = Article.popular.limit(5)
    
        # 両方の記事リストを結合し、重複を削除して新しい順にソート
        @articles = (following_and_own_articles + popular_articles).uniq.sort_by { |article| article[:created_at] }.reverse
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
        @article = current_user.articles.build(article_params)
    
        if @article.save
            redirect_to root_path, notice: '記事を投稿しました。'
        else
            flash.now[:alert] = '記事の投稿に失敗しました。'
            render :new
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        if @article.user == current_user
            @article.likes.destroy_all # 記事に関連するいいねをすべて削除
            @article.destroy!
            redirect_to articles_url, notice: '記事が削除されました。'
        else
            redirect_to articles_path, alert: 'この記事を削除する権限がありません。'
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