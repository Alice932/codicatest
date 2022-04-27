class Ability
  include CanCan::Ability

   def initialize(user)
    user ||= User.new

    if user.admin_role?
      can :manage, :all
    elsif user.patient_role?
      can :read, Doctor
      can :read, Appointment
      can :create, Appointment
    elsif user.doctor_role?
      can :read, Patient
      can :update, Appointment
      can :read, Appointment
    else
      can :read, Doctor
    end
  end
end
