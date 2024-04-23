class BlogsController < ApplicationController
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
    Blog.create(blog_parameter)
    redirect_to blogs_path, notice:"予定を作成しました"
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
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:blog_title, :blog_text, :start_time)
  end

end