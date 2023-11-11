class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 6..20 }

  has_one :profile, dependent: :destroy
  has_many :articles
  has_many :likes
  has_many :comments

  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :following_relationships, source: :following
  has_many :follower_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :follower, through: :follower_relationships, source: :follower


  after_create :create_profile #user登録した際にprofileが作られるように設定。

  def profile_image_url
    if profile&.avatar&.attached?
      Rails.application.routes.url_helpers.rails_blob_path(profile.avatar, only_path: true)
    else
      # デフォルト画像URLまたはnilを返す
    end
  end
  

  def has_liked?(article)
    likes.exists?(article_id: article.id)
  end

  def following?(user)
    following_relationships.exists?(following_id: user.id)
  end

  def follow!(user)
    following_relationships.create!(following_id: user.id)
  end

  def unfollow!(user)
    relation = following_relationships.find_by!(following_id: user.id)
    relation.destroy!
  end

  private

  def create_profile
    self.build_profile.save! 
  end

end
