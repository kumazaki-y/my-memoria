class CommentSerializer < ActiveModel::Serializer
  attributes :content, :user_username, :user_profile_image

  def user_username
    object.user.username
  end

  def user_profile_image
    Rails.application.routes.url_helpers.rails_blob_path(object.user.profile.avatar, only_path: true) if object.user.profile.avatar.attached?
  end
end
