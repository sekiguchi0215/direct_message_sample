class MessagesController < ApplicationController
  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      message = Message.create(message_params)
      entry = message.room.entries.select(:user_id).where.not(user_id: current_user.id)
      message.create_notification_direct_message!(current_user, entry.first[:user_id])
      redirect_to room_path(message.room_id)
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
    end
  end

  def update
    @message = Message.find(params[:id])
    @message.update(is_valid: false)
    redirect_to room_path(@message.room_id)
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :room_id, :content).merge(user_id: current_user.id)
  end
end
