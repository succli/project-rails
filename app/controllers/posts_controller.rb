class PostsController < ApplicationController
  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.order('posts.created_at DESC').paginate(page: params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "A bejegyzést sikeresen közzétettük!"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Bejegyzés frissítve."
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Bejegyzés törölve"
    redirect_to posts_url
  end
  
  private

    def post_params
      params.require(:post).permit(:title, :content, :user_id, :featured_image)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
