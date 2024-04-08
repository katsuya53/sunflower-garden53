class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :post_title, presence: true
  validates :post_text, presence: true
  validates :image, presence: true

  def self.search(search)
    if search.present?
      Post.where('post_title LIKE ? OR post_text LIKE ?', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end
end
