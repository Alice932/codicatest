module AppointmentsHelper
  def id_set
    if current_user
      if current_user.patient_role? && current_user.patient_id == nil
        @user = User.find(current_user.id)
        @patient = Patient.new
        @patient.name = @user.username
        @patient.save
        @user.patient_id = @patient.id
        @user.save
      elsif current_user.doctor_role? && current_user.doctor_id == nil
        @user = User.find(current_user.id)
        @doctor = Doctor.new
        @doctor.name = @user.username
        @doctor.save
        @user.doctor_id = @doctor.id
        @user.save
      end
    end
  end

  def check_status(appointment)
    if appointment.recomendation?
      appointment.status = 1
    end
  end

  def add_ids(appointment)
    doctor = Doctor.find(appointment.doctor_id)
    doctor.patients_ids.push(appointment.patient_id)
    doctor.patients_ids.uniq!
    doctor.save
  end
end
