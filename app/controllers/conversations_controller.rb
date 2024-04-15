# frozen_string_literal: true

class ConversationsController < ApplicationController
  def index
    @users = if params[:search_query].present?
               [current_user.followings.where('username LIKE ?',
                                              "%#{params[:search_query]}%") + current_user.followers.where(
                                                'username LIKE ?', "%#{params[:search_query]}%"
                                              )].flatten
             else
               []
             end
    @conversations = current_user.conversations

    return unless turbo_frame_request?

    render partial: 'conversations/conversation_search_results', locals: { users: @users }
  end

  def show
    conversation = Conversation.find(params[:id])
    @messages = conversation.messages

    session[:conversation_id] = conversation.id
    render turbo_stream: turbo_stream.replace('messaging_box', partial: 'conversations/show',
                                                               locals: { conversation: })
  end
end
