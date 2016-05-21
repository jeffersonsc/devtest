class TwitterUser < ActiveRecord::Base
	has_many :occurrences, dependent: :destroy

	validates_presence_of :name, :screen_name, :twitter_id


	#This method of create ou update twitter user
	def self.create_or_update_twitter_user(user)
		
		TwitterUser.where(twitter_id: user[:id_str]).first_or_initialize do |twitter_user|
			twitter_user.name = user[:name]
			twitter_user.screen_name = "@#{user[:screen_name]}"
			twitter_user.followers = user[:followers_count]

			twitter_user.save!
		end

	end
end
