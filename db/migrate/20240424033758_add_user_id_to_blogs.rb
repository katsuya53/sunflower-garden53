class AddUserIdToBlogs < ActiveRecord::Migration[7.0]
  def change
    # blog_sent カラムが存在しない場合のみ追加
    add_column :blogs, :blog_sent, :boolean, default: false unless column_exists?(:blogs, :blog_sent)

    # user_id カラムが存在しない場合のみ追加
    unless column_exists?(:blogs, :user_id)
      add_reference :blogs, :user, foreign_key: true, null: false
    end
  end
end
