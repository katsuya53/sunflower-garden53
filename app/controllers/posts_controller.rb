class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.all
    @posts = Post.includes(:user).order("created_at DESC")
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
    #@comment = Comment.new
    #@comments = @post.comments.includes(:user)
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
