# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @message = Message.new(set_params)
    return if @message.save

    put 'couldnt save'
  end

  private

  def set_params
    params.require(:message).permit(:content, :user_id, :conversation_id)
  end
end
