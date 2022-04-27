require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  let(:admin { create(:user, :admin) }
  before { sign_in(admin) }

  describe "Create /appointments" do
    it "should create" do
      get new_appointment_path
      expect(page).to have_content('created')
    end
    let(:params) do
      attributes_for(:acceptance_act, user: admin)
        .merge(user_id: employee.id, invoice_id: invoice.id, payment_amount: 42)
    end

  end
end
