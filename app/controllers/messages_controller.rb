class MessagesController < ApplicationController
  before_action :set_room_message
  def index
    @messages = @room.messages
  end
  
  def create
    message = Message.new(message_params)
    if message.save
      redirect_to room_messages_path(params[:room_id])
    else
      render "messages/index"
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:content).merge(room_id: params.require(:room_id)).merge(user_id: current_user.id)
  end
  
  def set_room_message
    @room = Room.includes(:messages).find(params[:room_id])
    @message = Message.new
  end

end
