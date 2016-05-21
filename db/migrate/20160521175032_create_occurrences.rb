class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.references :twitter_user, index: true, foreign_key: true
      t.integer :tweet_id
      t.string :content
      t.integer :retweet_count, default: 0
      t.integer :favourites_count, default: 0
      t.timestamp :tweet_created_at

      t.timestamps null: false
    end
  end
end