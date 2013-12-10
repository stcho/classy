class AddTopicToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :topic_id, :integer
  end
end
