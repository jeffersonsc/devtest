require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  let(:valid_user_attributes) { FactoryGirl.attributes_for(:user) }
  let(:valid_session) { {} }
  
  before do
    login user
  end

  describe "GET #index" do
    before do
      get :index
    end
    it { expect(response).to have_http_status(:success) }
    it { expect(assigns[:users]).to eq([user, user1, user2])}
  end

  describe "GET #show" do
    before do
      get :show, id: user.id
    end
    it { expect(response).to have_http_status(:success) }
    it { expect(assigns[:user]).to eq(user) }
    it { expect(response).to render_template(:show)}
  end

  describe "GET #new" do
    before do 
      get :new
    end
    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:new)}
  end

  describe "POST #create" do
    describe "Create user with valid attributes" do
      it "create valid attributes" do
        expect {
          post :create, {user: valid_user_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "verify user persisted" do
        post :create, {:user => valid_user_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it  "verify redirect after create" do
        post :create, {:user => valid_user_attributes}, valid_session
        expect(response).to redirect_to(User.last)
      end
    end

    describe "Create user with invald attributes" do
      before do
        post :create, {user: {name: '', email: 'bol.com'}}, valid_session
      end

      it {expect(assigns[:user]).not_to be_persisted }
      it {expect(response).to render_template(:new)}
    end
    
  end

  describe "GET #edit" do
    before do
      get :edit, id: user.id
    end
    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:edit)}
    it { expect(assigns[:user]).to eq(user)}    
  end

  describe "PUT #update" do
    describe "Valid attributes" do
      before do
        put :update, { id: user.id, user: { name: 'Test 10' } }, valid_session
      end

      it "verify persisted" do
        expect(assigns[:user]).to be_persisted
      end

      it "corect user" do
        expect(assigns[:user][:name]).to eq('Test 10')
      end

      it "verify redirect" do
        expect(response).to redirect_to(user)
      end
    end

    describe "Invalid attributes" do
      before do
        put :update, { id: user.id, user: { name: '' } }, valid_session
      end

      it "verify redirect" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "Destroy user" do
      expect {
        delete :destroy, {:id => user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirect to users" do
      user = User.create! valid_user_attributes
      delete :destroy, {:id => user.to_param}, valid_session
      expect(response).to redirect_to(users_url)
    end
  end

  
end
