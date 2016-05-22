FactoryGirl.define do
	factory :occurrence do
		twitter_user_id 1
		tweet_id "123456"
		content "@locaweb test my web site"
		retweet_count 2
		favourites_count 0
		tweet_created_at DateTime.now
	end
end