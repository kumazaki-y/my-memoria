class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :content, presence: true, length: { maximum: 120 }

  after_create :send_email

    # 現在のユーザーがこのコメントの投稿者かどうかを返す
    def is_current_user(current_user)
      self.user_id == current_user.id
    end

  private
  def send_email #コメントでメンションされたユーザーに通知メールを送る
    mentions = content.scan(/@([a-zA-Z0-9_]+)/)
  
    mentions.each do |username|
      mentioned_user = User.find_by(username: username)
      if mentioned_user
        CommentMailer.mention_comment(mentioned_user, user).deliver_later
      end
    end
  end
end
