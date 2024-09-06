require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let(:valid_attributes) {
    { room_id: 1, location: 'Hunt Library', capacity: '100' }
  }

  let(:invalid_attributes) {
    { room_id: nil, location: nil, capacity: nil }
  }

  # Assuming you have a user factory and Devise set up
  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      Room.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      room = Room.create! valid_attributes
      get :show, params: { id: room.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      room = Room.create! valid_attributes
      get :edit, params: { id: room.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Room" do
        expect {
          post :create, params: { room: valid_attributes }
        }.to change(Room, :count).by(1)
      end

      it "redirects to the created room" do
        post :create, params: { room: valid_attributes }
        expect(response).to redirect_to(Room.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Room" do
        expect {
          post :create, params: { room: invalid_attributes }
        }.to change(Room, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post :create, params: { room: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { room_id: 2, location: 'New Location', capacity: '20' }
      }

      it "updates the requested room" do
        room = Room.create! valid_attributes
        patch :update, params: { id: room.to_param, room: new_attributes }
        room.reload
        expect(room.attributes).to include('room_id' => 2, 'location' => 'Talley Student Union', 'capacity' => '75')
      end

      it "redirects to the room" do
        room = Room.create! valid_attributes
        patch :update, params: { id: room.to_param, room: new_attributes }
        room.reload
        expect(response).to redirect_to(room)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response displaying the 'edit' template" do
        room = Room.create! valid_attributes
        patch :update, params: { id: room.to_param, room: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested room" do
      room = Room.create! valid_attributes
      expect {
        delete :destroy, params: { id: room.to_param }
      }.to change(Room, :count).by(-1)
    end

    it "redirects to the rooms list" do
      room = Room.create! valid_attributes
      delete :destroy, params: { id: room.to_param }
      expect(response).to redirect_to(rooms_url)
    end
  end
end