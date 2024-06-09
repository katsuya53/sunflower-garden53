class Post < ApplicationRecord
  before_destroy :delete_image

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_many :likes, dependent: :destroy

  validates :post_title, presence: { message: "を入力してください" }
  validates :post_text, presence: { message: "を入力してください" }
  validates :image, presence: { message: "を入力してください" }

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
      posts = left_outer_joins(:user, :tags, :comments)
                .where('posts.post_title LIKE ? OR posts.post_text LIKE ? OR users.nickname LIKE ? OR tags.tag_name LIKE ? OR comments.comment_text LIKE ?',
                       "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
                .distinct
      posts.load # クエリの結果を強制的に読み込む 検索結果が表示できない不具合の対応策
    else
      Post.includes(:user).order('updated_at DESC')
    end
  end

  private

  def delete_image
    image.purge if image.attached?
  end
end
