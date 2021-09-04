class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at)
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create!(post_params)
    redirect_to post
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, :status)
  end
end
