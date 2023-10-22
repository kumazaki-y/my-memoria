class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes

  validate :validate_images_count


  private

  def validate_images_count
    if images.count > 4
      errors.add(:images, "一度に送信できる画像は４枚までです")
    end
  end
end
