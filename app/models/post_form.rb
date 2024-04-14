class PostForm
  include ActiveModel::Model

  #PostFormクラスのオブジェクトがPostモデルの属性を扱えるようにする
  attr_accessor(
     :post_title, :post_text, :image, :user_id,
     :id, :created_at, :updated_at,
     :tag_name
   )

  with_options presence: true do
    validates :post_title, presence: true
    validates :post_text, presence: true
    validates :image, presence: true
  end

  def save
    # Post モデルにデータを保存する
    post = Post.new(post_title: post_title, post_text: post_text, image: image, user_id: user_id)
    
    if post.save
      # tag_name が存在する場合の追加の処理
      if tag_name.present?
        tag = Tag.where(tag_name: tag_name).first_or_initialize
        tag.save
        PostTagRelation.create(post_id: post.id, tag_id: tag.id)
      end
      
      return true
    else
      # 保存に失敗した場合はエラーメッセージをセットして false を返す
      post.errors.full_messages.each do |message|
        errors.add(:base, message)
      end
      return false
    end
  end
  

  def update(params, post)
    #一度タグの紐付けを消す
    post.post_tag_relations.destroy_all

    #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
    tag_name = params.delete(:tag_name)

    #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    #タグを保存
    tag.save if tag_name.present?
    post.update(params)
    PostTagRelation.create(post_id: post.id, tag_id: tag.id) if tag_name.present?
  end

  
end