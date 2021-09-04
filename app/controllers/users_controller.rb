class UsersController < ApplicationController
  def index
    @users = User.order(:created_at)
  end

  def show
    @user = User.find(params[:id])
    if current_user.id == @user.id
      @posts = @user.posts.all
    else
      @posts = @user.posts.where(status: "public")
    end
  end
end
