class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :article_id } #同じユーザーが同じ記事に複数回いいねできないように

  belongs_to :user
  belongs_to :article
end
