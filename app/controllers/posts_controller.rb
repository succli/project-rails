class PostsController < ApplicationController

  def index
    @posts = Post.order('posts.created_at DESC').paginate(page: params[:page])
  end

  def new
    @post = Post.new
  end

  def create
  
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Bejegyzés törölve"
    redirect_to posts_url
  end

end
