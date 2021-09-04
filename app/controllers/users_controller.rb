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
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)

    unless @user.id == current_user.index
      @currentUserEntry.each do |current_user|
        @userEntry.each do |user|
          if current_user.room_id == user.room_id
            @haveRoom = true
            @roomId = current_user.room_id
          end
        end
      end
      unless @haveRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
