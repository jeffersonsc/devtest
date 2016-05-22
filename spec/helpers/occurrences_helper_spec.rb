require 'rails_helper'

RSpec.describe OccurrencesHelper, type: :helper do
  describe "Return links for twitter" do
    it "#returns true to profile link" do
      expect(helper.twitter_link("@jeffersoncunha")).to eq('https://twitter.com/jeffersoncunha')
    end

    it "#Return link to tweet" do
    	expect(helper.tweet_link("@jeffersoncunha", "12345678")).to eq('https://twitter.com/jeffersoncunha/status/12345678')
  	end

  end
end
