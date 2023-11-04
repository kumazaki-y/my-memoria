# spec/models/article_spec.rb
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '画像の枚数制限' do
    let(:user) { FactoryBot.create(:user) } # ユーザーを作成

    context '画像が4枚の場合' do
      let(:article) { FactoryBot.create(:article, user: user, images_count: 4) } # ユーザーを記事に関連付け

      it '記事は有効である' do
        expect(article).to be_valid
      end
    end

    context '画像が5枚の場合' do
      let(:article) { FactoryBot.build(:article, user: user, images_count: 5) } # createではなくbuildを使用
    
      it '記事は無効である' do
        expect(article).to be_invalid
        expect(article.errors[:images]).to include("一度に送信できる画像は４枚までです")
      end
    end
    
  end
end
