class PostForm
  include ActiveModel::Model

  attr_accessor(
    :post_title, :post_text, :image, :user_id,
    :id, :created_at, :updated_at,
    :tag_name, :tag_name2, :tag_name3
  )

  with_options presence: true do
    validates :post_title, presence: true
    validates :post_text, presence: true
    validates :image, presence: true
  end
  
  def save
    post = Post.new(post_title: post_title, post_text: post_text, image: image, user_id: user_id)
    
    if post.save
      save_tags(post)
      return true
    else
      post.errors.full_messages.each do |message|
        errors.add(:base, message)
      end
      return false
    end
  end
  
  def update(params, post)
    post.assign_attributes(params.except(:tag_name, :tag_name2, :tag_name3))
    if post.save
      post.tags.destroy_all # 既存のタグを削除
      save_tags(post)
      return true
    else
      post.errors.full_messages.each do |message|
        errors.add(:base, message)
      end
      return false
    end
  end
  
  
  private
  
  def save_tags(post)
    [tag_name, tag_name2, tag_name3].compact.each do |tag_name|
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      PostTagRelation.create(post_id: post.id, tag_id: tag.id)
    end
  end
end