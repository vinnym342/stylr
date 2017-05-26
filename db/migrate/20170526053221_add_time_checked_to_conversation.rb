class AddTimeCheckedToConversation < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :stylist_viewed, :datetime
    add_column :conversations, :asker_viewed, :datetime
  end
end
