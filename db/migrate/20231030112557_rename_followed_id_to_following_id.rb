class RenameFollowedIdToFollowingId < ActiveRecord::Migration[6.0]
  def change
    rename_column :relationships, :followied_id, :following_id
  end
end
