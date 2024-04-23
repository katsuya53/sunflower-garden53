class BlogsController < ApplicationController
  before_action :move_to_index

  def index
    @blogs = Blog.all
    @blog = Blog.new
  end
  
  def new
    @blog = Blog.new
    @blog.start_time = DateTime.now
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = current_user.blogs.build(blog_parameter)
    if @blog.save
      redirect_to blogs_path, notice:"予定を作成しました"
    else
      @blogs = Blog.all
      redirect_to blogs_path, notice:"入力エラー。作成できませんでした"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"予定を削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to @blog ,notice: "予定を編集しました"
    else
      redirect_to edit_blog_path(@blog), notice:"入力エラー。更新できませんでした"
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:blog_title, :blog_text, :start_time)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path,notice: "ログインなしではアクセスできません。"
    end
  end

end