class CommentsController < ApplicationController
    before_action :set_article

    def index
      @default_avatar_url = view_context.asset_path('default-avatar.png')
      @comment = @article.comments.new
      @comments = @article.comments.order(created_at: :desc)
      respond_to do |format|
        format.html # HTMLページとしてコメント一覧を表示
        format.json do # JSONレスポンスとしてコメントデータを返す
          comments_json = @comments.as_json(include: {
            user: {
              only: [:username, :id], # 必要なユーザー情報を指定
              methods: :profile_image_url # プロフィール画像のURLを返すメソッド
            }
          })
    
          comments_json.each do |comment|
            comment["is_current_user"] = (comment["user"]["id"] == current_user.id)
          end
    
          render json: comments_json
        end
      end
    end
    

    def create
      @default_avatar_url = view_context.asset_path('default-avatar.png')
      @comment = @article.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        comment_data = @comment.as_json(include: {
          user: {
            only: [:username, :id],
            methods: :profile_image_url
          }
        })
        comment_data[:is_current_user] = @comment.is_current_user(current_user)
        render json: comment_data
      else
        render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    

    def destroy
      @comment = @article.comments.find_by(id: params[:id])
      if @comment && @comment.user == current_user
        @comment.destroy
        render json: { success: true, message: 'コメントが削除されました。' }
      else
        render json: { success: false, message: 'コメントの削除に失敗しました。' }, status: :unprocessable_entity
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
  