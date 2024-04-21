class AddLikesCountToPosts < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:posts, :likes_count)
      add_column :posts, :likes_count, :integer, default: 0
    end
  end
end