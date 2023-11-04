require 'rails_helper'

RSpec.describe "いいね機能", type: :request do
  describe "POST /create" do
    let!(:user) { create(:user) }
    let(:article) { create(:article, user: user) }

    context "ユーザーがまだ記事を「いいね」していない場合" do
      it "記事を「いいね」する" do
        sign_in user
        post article_like_path(article_id: article.id), xhr: true
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('liked')
      end
    end

    context "ユーザーが既に記事を「いいね」している場合" do
      before do
        article.likes.create(user: user)
      end

      it "エラーを返す" do
        sign_in user
        post article_like_path(article_id: article.id), xhr: true
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('Already liked')
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:user) { create(:user) }
    let(:article) { create(:article, user: user) }
    let!(:like) { article.likes.create(user: user) }

    it "「いいね」を取り消す" do
      sign_in user
      delete article_like_path(article_id: article.id), xhr: true
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('unliked')
    end
  end
end
