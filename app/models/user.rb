class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_one :profile, dependent: :destroy



  after_create :create_profile #user登録した際にprofileが作られるように設定。


  private

  def create_profile
    self.build_profile.save! 
  end

end
