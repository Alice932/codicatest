class Ability
  include CanCan::Ability

   def initialize(user)
    user ||= User.new

    if user.admin_role?
      can :manage, :all
    elsif user.patient_role?
      can :read, Doctor
      can :read, Appointment if doctor_id: user.id
    elsif user.doctor_role?
      can :read, Patient
      can :read, Appointment
    else
      can :read, Doctor
    end
  end
end
