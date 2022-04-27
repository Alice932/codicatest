require 'rails_helper'

RSpec.feature "Doctors", type: :feature do

  describe "Write recomendation" do
    user = User.create(
                      role: "doctor",
                      username: 'Second Doctor',
                      email: 'doctor@test.com',
                      password: "12345678",
                      password_confirmation: "12345678",
                      doctor_id: 3)
    doctor = Doctor.create(id: 3, name: user.username, speciality: 'Psychiatrist')
    patient = Patient.create(name: "Second Patient")
    @appointment = Appointment.create(id: 3, doctor_id: user.doctor_id, patient_id: patient.id)
    @appointment.save

    before do
      visit root_url
      sign_in user
    end

    it "render edit" do
      visit "/appointments/3/edit"
      expect(response).to render_template(:edit)
    end

  end
end
