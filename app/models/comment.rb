class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :content, presence: true, length: { maximum: 120 }

  after_create :send_email

  private
  def send_email
    mentions = content.scan(/@([a-zA-Z0-9_]+)/)
  
    mentions.each do |username|
      mentioned_user = User.find_by(username: username)
      if mentioned_user
        CommentMailer.mention_comment(mentioned_user, user).deliver_later
      end
    end
  end
end
