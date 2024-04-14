class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.all
    @posts = Post.includes(:user).order("created_at DESC")
    @comment_count = {} # コメント数を格納するハッシュを初期化
    @posts.each do |post|
      @comment_count[post.id] = post.comments.count # 各投稿のコメント数を取得しハッシュに格納
    end
  
  end

  def new
    @post_form = PostForm.new
  end

  def create
     @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    puts "@post: #{@post.inspect}" # デバッグ情報を出力
    @post.destroy
    redirect_to root_path
  end

  def edit
    # @postから情報をハッシュとして取り出し、@post_formとしてインスタンス生成する
    post_attributes = @post.attributes
    @post_form = PostForm.new(post_attributes)
    @post_form.tag_name = @post.tags.first&.tag_name
  end

  def update
    # paramsの内容を反映したインスタンスを生成する
    @post_form = PostForm.new(post_form_params)

    # 画像を選択し直していない場合は、既存の画像をセットする
    @post_form.image ||= @post.image.blob

    if @post_form.valid?
      @post_form.update(post_form_params, @post)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  @comment = Comment.new
  @comments = @post.comments.includes(:user)
  @comment_count = @comments.count
  
  # コメントの編集ボタンを表示するための情報を取得
  if user_signed_in?
    @editable_comments = @comments.select { |comment| comment.user_id == current_user.id }
  else
    @editable_comments = []
  end
end
  
  def search
    @posts = Post.search(params[:keyword])
  end

  def search_tag
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end


  private

  def post_form_params
    params.require(:post_form).permit(:image, :post_title, :post_text, :tag_name).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
