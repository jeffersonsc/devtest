module OccurrencesHelper
	def twitter_link(username)
		url = "https://twitter.com/" + username(username)
	end

	def tweet_link(username, tweet_id)
		url = "https://twitter.com/#{username(username)}/status/#{tweet_id}"
	end

	def username(username)
		username.gsub('@', '').strip
	end
end
