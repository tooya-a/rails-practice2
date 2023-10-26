class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end


end
