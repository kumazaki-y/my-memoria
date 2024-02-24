class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validate :validate_images_count

  scope :in_last_24_hours, -> { where('articles.created_at > ?', 24.hours.ago) }#人気記事の表示スコープ
  scope :popular, -> { 
    joins(:likes)
    .select('articles.*, COUNT(likes.id) AS likes_count')
    .group('articles.id')
    .order('likes_count DESC')
  }

    scope :search_by_text, ->(query) { where("text LIKE ?", "%#{query}%") } #記事のテキスト検索スコープ
    scope :search_by_username, -> (query) { joins(:user).where("users.name LIKE ?", "%#{query}%") }#記事のユーザー検索スコープ
  
  private

  def validate_images_count
    if images.count == 0
      errors.add(:base, "少なくとも1枚の画像が必要です")
    elsif images.count > 3
      errors.add(:base, "一度に送信できる画像は3枚までです")
    end
  end
end
