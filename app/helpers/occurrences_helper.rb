module OccurrencesHelper
	def twitter_link(username)
		url = "https://twitter.com/" + username.gsub('@', '').strip
	end
end
