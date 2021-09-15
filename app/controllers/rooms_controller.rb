class RoomsController < ApplicationController
  def create
    @room = Room.create
    @currentUserEntry = Entry.create(user_id: current_user.id, room_id: @room.id)
    @userEntry = Entry.create(entry_params)
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.order(:id)
      @message = Message.new
      @entries = @room.entries
    else
      redierct_back(fallback_location: root_path)
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
