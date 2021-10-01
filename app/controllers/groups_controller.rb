class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update show destroy]

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def show
    @users = @group.users.order(:created_at)
    @group.check_group_message_notification(current_user)
    group_user_ids = GroupUser.where(group_id: @group.id).pluck(:user_id)
    @other_users = User.where.not(user_id: group_user_ids)
    unless @users.include?(current_user)
      redirect_to root_path
    end
    if GroupUser.where(user_id: current_user.id, group_id: @group.id).present?
      @messages = @group.group_messages.order(:id)
      @message = GroupMessage.new
      @GroupUser = @group.group_users
    else
      redierct_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def invitation
    @group = Group.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    if @group.group_invitation_notification(current_user, @user.id, @group.id)
      binding.pry
      redirect_to request.referer
    end
  end

  def join
    @group = Group.find(params[:id])
    unless @group.users.include?(current_user)
      @group.users << current_user
    end
    redirect_to group_path(@group)
  end

  private

  def group_params
    params.require(:group).permit(:name, :user_id, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
