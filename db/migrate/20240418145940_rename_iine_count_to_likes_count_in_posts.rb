class RenameIineCountToLikesCountInPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :iine_count, :likes_count
  end
end