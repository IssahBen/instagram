# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @users = if params[:search_query].present?
               User.where('username LIKE ?', "%#{params[:search_query]}%")
             else
               []
             end

    return unless turbo_frame_request?

    render partial: 'layouts/search_results', locals: { users: @users }
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
