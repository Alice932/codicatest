# frozen_string_literal: true

class AppointmentsController < ApplicationController
  include AppointmentsHelper

  def index
    @appointments = Appointment.all
    id_set()
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      add_ids(@appointment)
      redirect_to @appointment
    else
      render :new
    end
  end

  def new
    @appointment = Appointment.new
    @patients = Patient.all
    @doctors = Doctor.all
    @avaliable_doctors = max_appoitnments
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @patients = Patient.all
    @doctors = Doctor.all
    @avaliable_doctors = max_appoitnments
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :recomendation)
  end
end
