class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:create, :update, :destroy]  # set_post を destroy アクションでも使用する
  before_action :move_to_index
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to root_path, alert: "Failed to create comment."
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      @comment.touch # 更新日時を更新
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  # コメントの情報を取得するメソッドを追加
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    if params[:post_id].present?
      @post = Post.find(params[:post_id])  # コメントが関連付けられるpostを取得
    else
      @post = @comment.post
    end
  end
  
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, post_id: @post.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path,notice: "ログインなしではアクセスできません。"
    end
  end

end