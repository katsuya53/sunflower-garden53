class AddIineCountToPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :iine_count, :integer, default: 0
  end
end