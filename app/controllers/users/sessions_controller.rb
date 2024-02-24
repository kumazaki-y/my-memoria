class Users::SessionsController < Devise::SessionsController
    def guest_sign_in
        user = User.guest
        sign_in user
        redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
    end

    def destroy
        if current_user.guest?
            guest_user = current_user
            guest_user.destroy
            super # Deviseの元のログアウト処理を実行
        else
            super
        end
    end

end