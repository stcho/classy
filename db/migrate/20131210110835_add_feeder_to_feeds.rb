class AddFeederToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :feeder, :string
  end
end
