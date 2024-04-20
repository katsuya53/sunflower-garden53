class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_many :likes, dependent: :destroy
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def increment_likes_count
    self.likes_count += 1
    save
  end

  def decrement_likes_count
    self.likes_count -= 1
    save
  end
  
  def self.search(search)
    if search.present?
      where('post_title LIKE ? OR post_text LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end