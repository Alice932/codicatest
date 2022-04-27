# frozen_string_literal: true

module AppointmentsHelper
  def id_set
    if current_user
      if current_user.patient_role? && current_user.patient_id.nil?
        @user = User.find(current_user.id)
        @patient = Patient.new
        @patient.name = @user.username
        @patient.save
        @user.patient_id = @patient.id
        @user.save
      elsif current_user.doctor_role? && current_user.doctor_id.nil?
        @user = User.find(current_user.id)
        @doctor = Doctor.new
        @doctor.name = @user.username
        @doctor.email = @user.email
        @doctor.save
        @user.doctor_id = @doctor.id
        @user.save
      end
    end
  end

  def check_status(appointment)
    appointment.status = 1 if appointment.recomendation?
  end

  def add_ids(appointment)
    doctor = Doctor.find(appointment.doctor_id)
    doctor.patients_ids.push(appointment.patient_id)
    doctor.patients_ids.uniq!
    doctor.save
  end

  def max_appoitnments
    @appointments = Appointment.all
    @avaliable_doctors = []
    doctors = Doctor.all
    doctors.each do |doctor|
      if @appointments.where(doctor_id: doctor.id).count < 10
        @avaliable_doctors.push(doctor)
      else
        @avaliable_doctors.delete(doctor)
      end
    end
    @avaliable_doctors.uniq
  end
end
