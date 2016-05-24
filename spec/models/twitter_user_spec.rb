require 'rails_helper'

RSpec.describe TwitterUser, type: :model do
  describe "Validate attributes" do
  	it {should validate_presence_of(:name)}
  	it {should validate_presence_of(:screen_name)}
  	it {should validate_presence_of(:twitter_id)}
  end

  describe "Valid assocition" do
  	it {should have_many(:occurrences)}
  end
end
