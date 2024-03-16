class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :search]

  def index
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
