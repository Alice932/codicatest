# frozen_string_literal: true

class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    @appointments = Appointment.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(patients_params)
    if @patient.save
      redirect_to @patient
    else
      render :new
    end
  end

  def new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patients_params)
      redirect_to @patient
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path
  end

  private

  def patients_params
    params.require(:patient).permit(:id, :name)
  end
end
