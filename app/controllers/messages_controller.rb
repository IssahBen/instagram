class MessagesController < ApplicationController
    def create 
        @message = Message.new(set_params)
        if @message.save 
            render turbo_stream: turbo_stream.append("messages-container",partial: "messages/message",locals:{message: @message})
        else 
            put "couldnt save"
        end
    end 

    private 

    def set_params 
        params.require(:message).permit(:content,:user_id,:conversation_id)
    end



end
