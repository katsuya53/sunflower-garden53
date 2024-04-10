class CommentsController < ApplicationController
  before_action :set_post, only: [:edit]
  
  def create
    comment = Comment.create(comment_params)
    redirect_to "/posts/#{comment.post.id}"
  end


  def edit
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      @comment.touch # 更新日時を更新
      redirect_to post_path(@comment.post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @comment = Comment.find(params[:id])
  end


  def comment_params
    comment = Comment.find(params[:id])  # 更新しようとしているコメントを取得
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, post_id: comment.post_id)
  end
end
