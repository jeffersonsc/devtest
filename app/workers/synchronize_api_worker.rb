class SynchronizeApiWorker
	require 'rest-client'
	include Sidekiq::Worker

	sidekiq_options queue: 'default'
	
	def perform

		#URL get twittes http://tweeps.locaweb.com.br/
		url = 'http://tweeps.locaweb.com.br/'
		username = 'jeffersondasilva@boldint.com'

		results = RestClient::Request.execute(method: :get, url: url , headers: {Username: username})

		JSON.parse(results.body, symbolize_names: true)[:statuses].each do |status|
			next if !status[:text].include?("@locaweb") and status[:entities][:user_mentions].map{|um| um[:id] == 42}.count > 0
			

			#Verfy if new tweet is not retweet
			if status[:retweeted] == false
				
				#Set user in user
				user = TwitterUser.create_or_update_twitter_user(status[:user])
				if user.persisted?
					#Create occurrences for user
					Occurrence.where(tweet_id: status[:id_str]).first_or_initialize do |occurrence|
						occurrence.twitter_user = user
						occurrence.content = status[:text]
						occurrence.retweet_count = status[:retweet_count]
						occurrence.favourites_count = status[:favourites_count].to_i
						occurrence.tweet_created_at = status[:created_at]
						occurrence.twitter_user.retweets_count += status[:retweet_count]

						occurrence.save!
					end			
				end				
			end
		end
	end	
end