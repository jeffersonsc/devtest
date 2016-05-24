require 'rails_helper'

RSpec.describe OccurrencesController, type: :controller do
  before do
    user = FactoryGirl.create(:user)
    login(user)
  end

  let!(:occurrence) {FactoryGirl.create(:occurrence, twitter_user: FactoryGirl.create(:twitter_user))}

  describe "GET #index" do
    before do
      get :index
    end
    
     it { expect(response).to have_http_status(:success) }
     it { expect(response).to render_template(:index) }    
     it { expect(assigns[:occurrences][0][:content]).to include(occurrence.content) }

  end

  describe "GET #show" do
    before do
      get :show, id: occurrence.id
    end
    
    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:show) }
    it { expect(assigns[:occurrence][:content]).to include(occurrence.content) }
  end

end
