class UserConversationsController < ApplicationController 
    def  create 
        byebug
        conversation = Conversation.create
        participant_conversation = UserConversation.new(user: User.find(params[:participant_id]),conversation: conversation)
        current_user_conversation = UserConversation.new(user: current_user,conversation: conversation)
        if participant_conversation.save && current_user_conversation.save 
            flash[:notice] = "Conversation Created"
            redirect_to conversations_path 
        end


    end 
end