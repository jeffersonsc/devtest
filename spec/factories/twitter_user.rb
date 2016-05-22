FactoryGirl.define do
	factory :twitter_user do
    name_str = FFaker::Name.name
    name name_str
    twitter_id "12345"
    screen_name name_str.parameterize.underscore
    followers 10
    retweets_count 0
  end
end