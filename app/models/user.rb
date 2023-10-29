class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_one :profile, dependent: :destroy
  has_many :articles
  has_many :likes
  has_many :comments

  has_many :followed_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, through: :followed_relationships, source: :followed
  has_many :follower_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :follower, through: :follower_relationships, source: :follower


  after_create :create_profile #user登録した際にprofileが作られるように設定。


  def followed?(user)
    followed_relationships.exists?(followed_id: user.id)
  end

  def follow!(user)
    followed_relationships.create!(followed_id: user.id)
  end

  def unfollow!(user)
    relation = followed_relationships.find_by!(followed_id: user.id)
    relation.destroy!
  end

  private

  def create_profile
    self.build_profile.save! 
  end

end
