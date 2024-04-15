# frozen_string_literal: true

class Follow < ApplicationRecord
  before_create :check_privacy
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  def accept
    update(accepted: true)
  end

  private

  def check_privacy
    self.accepted = true unless followed.private
  end
end
