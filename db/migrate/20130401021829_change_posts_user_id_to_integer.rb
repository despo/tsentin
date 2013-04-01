class ChangePostsUserIdToInteger < ActiveRecord::Migration
  def up
    remove_column :posts, :user_id
    add_column :posts, :user_id, :integer
  end
end
