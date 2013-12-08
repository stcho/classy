class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.text :text

      t.timestamps
    end
  end
end
