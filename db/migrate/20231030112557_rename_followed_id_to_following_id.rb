class RenameFollowingIdToFollowingId < ActiveRecord::Migration[6.0]
  def change
    rename_column :relationships, :following_id, :following_id
  end
end
