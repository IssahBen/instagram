# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_one_attached :profile_pic
  has_many :likes
  has_many :comments
  has_many :user_conversations
  has_many :conversations, through: :user_conversations
  has_many :messages

  has_many :accepted_received_requests, -> { where(accepted: true) }, class_name: 'Follow', foreign_key: 'followed_id'
  has_many :follow_requests, -> { where(accepted: false) }, class_name: 'Follow', foreign_key: 'followed_id'

  has_many :accepted_sent_requests, -> { where(accepted: true) }, class_name: 'Follow', foreign_key: 'follower_id'

  has_many :waiting_sent_requests, -> { where(accepted: false) }, class_name: 'Follow', foreign_key: 'follower_id'

  has_many :followers, through: :accepted_received_requests, source: :follower

  has_many :followings, through: :accepted_sent_requests, source: :followed

  has_many :waiting_followings, through: :waiting_sent_requests, source: :followed

  def follow(user)
    @follow = Follow.create(follower: self, followed: user)
    Rails.logger.debug @follow.errors.full_messages
  end

  def unfollow(user)
    accepted_sent_requests.find_by(followed: user)&.destroy
  end

  def cancel_request(user)
    waiting_sent_requests.find_by(followed: user)&.destroy
  end
end
