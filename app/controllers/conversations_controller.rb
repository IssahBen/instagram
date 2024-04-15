class ConversationsController < ApplicationController
  
    def index
      if params[:search_query].present?
        @users = [current_user.followings.where("username LIKE ?", "%#{params[:search_query]}%") +  current_user.followers.where("username LIKE ?", "%#{params[:search_query]}%")].flatten
      else
        @users = []
      end
      @conversations = current_user.conversations
 
      if turbo_frame_request?
        render partial: "conversations/conversation_search_results", locals: {users: @users}
      end
   end

   def show 
    conversation = Conversation.find(params[:id])
    @messages = conversation.messages
    
    session[:conversation_id] = conversation.id
    render turbo_stream: turbo_stream.replace("messaging_box",partial: "conversations/show",locals: {conversation: conversation})
   end 
  
end
