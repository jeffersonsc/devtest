require 'rails_helper'

RSpec.describe Occurrence, type: :model do
  describe "Validate attributes" do
  	it {should validate_presence_of(:tweet_id)}
  	it {should validate_presence_of(:content)}
  	it {should validate_presence_of(:tweet_created_at)}
  end

  describe "Valid assocition" do
  	it {should belong_to(:twitter_user)}
  end
end
