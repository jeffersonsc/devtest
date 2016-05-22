require 'rails_helper'

RSpec.describe "occurrences/index.html.erb", type: :view do
  describe "Render one occurrence" do
  	before(:each) do
  		let!(:occurrence) { FactoryGirl.create(:occurrence, twitter_user: FactoryGirl.create(:twitter_user)) }

  		it "#render" do
  			render

  			rendered.should contain(occurrence.name)
  		end
  	end

  end
end
