# frozen_string_literal: true

class CreateUserConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :user_conversations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :conversation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
