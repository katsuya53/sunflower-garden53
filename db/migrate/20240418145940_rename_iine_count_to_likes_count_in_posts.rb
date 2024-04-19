class RenameIineCountToLikesCountInPosts < ActiveRecord::Migration[6.0]
  def change
    # iine_countカラムが存在する場合のみ、カラム名を変更する
    if column_exists?(:posts, :iine_count)
      rename_column :posts, :iine_count, :likes_count
    end
  end
end