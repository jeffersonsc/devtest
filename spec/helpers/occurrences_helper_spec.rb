require 'rails_helper'

RSpec.describe OccurrencesHelper, type: :helper do
  describe "#convert date" do
    it "returns true" do
      expect(helper.twitter_link("@jeffersoncunha")).to eq('https://twitter.com/jeffersoncunha')
    end
  end
end
