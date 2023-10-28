class CommentMailer < ApplicationMailer

    def mention_comment(mentioned_user,user)
        @user = user
        mail to: mentioned_user.email, subject: '【お知らせ】あなた宛のコメントが投稿されました'
    end

end