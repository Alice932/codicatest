class Ability
  include CanCan::Ability

   def initialize(user)
    if user.admin_role?
      can :manage, :all
    elsif user.patient_role?
      can :read, :all
    elsif user.doctor_role?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
