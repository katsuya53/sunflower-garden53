class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
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
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
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
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @post.touch # 更新日時を更新
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


  private

  def post_params
    params.require(:post).permit(:image, :post_title, :post_text).merge(user_id: current_user.id)
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
