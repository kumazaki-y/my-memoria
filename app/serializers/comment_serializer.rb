class CommentSerializer < ActiveModel::Serializer
  # json形式でフロントエンドに返すデータを指定
  attributes :content, :user_username, :user_profile_image


  def user_username
    # display_nameが存在する場合はそれを、そうでない場合はusernameを使用
    object.user.display_name || object.user.username
  end

  def user_profile_image
    Rails.application.routes.url_helpers.rails_blob_path(object.user.profile.avatar, only_path: true) if object.user.profile.avatar.attached?
  end
end
