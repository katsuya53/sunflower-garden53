class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :blog_title
      t.text :blog_text
      t.datetime :start_time
      t.boolean :blog_sent, default: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
