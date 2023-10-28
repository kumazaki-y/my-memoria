class CommentMailer < ApplicationMailer::Base

    def mention_comment(user, comment_user)
        @user = user
        @comment_user = comment_user
        mail to: user.email, subuject: '【お知らせ】あなた宛のコメントが投稿されました'
    end

end