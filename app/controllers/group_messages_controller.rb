class GroupMessagesController < ApplicationController
  def create
    if GroupUser.where(user_id: current_user.id, group_id: params[:group_message][:group_id]).present?
      @message = GroupMessage.create(message_params)
      redirect_to group_path(@message.group_id)
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
    end
  end

  private

  def message_params
    params.require(:group_message).permit(:user_id, :group_id, :content).merge(user_id: current_user.id)
  end
end
