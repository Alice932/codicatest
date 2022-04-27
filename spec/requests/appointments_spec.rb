require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  describe "Create /appointments" do
    user = User.create(id: 3,
                      username: 'Admin Patient',
                      email: 'admin@test.com',
                      password: "12345678",
                      password_confirmation: "12345678")
    doctor = Doctor.create(name: 'First Doctor', speciality: 'Psychiatrist')
    before do
      visit root_url
      sign_in user
    end

    it "should create" do
      get "/appointments/new"
      expect(response).to render_template(:new)
    end
  end
end
