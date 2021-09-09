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
    unless @users.include?(current_user)
      redirect_to root_path
    end
    if GroupUser.where(user_id: current_user.id, group_id: @group.id).present?
      @messages = @group.group_messages
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

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
