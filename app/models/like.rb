class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_post_likes_count
  after_destroy :decrement_post_likes_count

  private

  def increment_post_likes_count
    post.increment!(:likes_count)
  end

  def decrement_post_likes_count
    post.decrement!(:likes_count)
  end
end