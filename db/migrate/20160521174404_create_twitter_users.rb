class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :name
      t.string :twitter_id
      t.string :screen_name
      t.integer :followers, dafault: 0
      t.integer :retweets_count, default: 0

      t.timestamps null: false
    end
  end
end
