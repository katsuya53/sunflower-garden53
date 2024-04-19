class LikesController < ApplicationController
  before_action :set_post

  def create
    like = current_user.likes.build(post_id: params[:post_id])
    if like.save
      @post.increment_likes_count
      respond_to do |format|
        format.js
        format.html { redirect_back(fallback_location: root_path) }
      end
    else
      # エラー処理
    end
  end

  def destroy
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    if like&.destroy
      @post.decrement_likes_count
      respond_to do |format|
        format.js
        format.html { redirect_back(fallback_location: root_path) }
      end
    else
      # エラー処理
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end