class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
  @appointment = Appointment.new(appoint_params)
      if
        @appointment.save
        redirect_to appointments_path
      else
        render :new
      end
  end

private
   def appoint_params
      params.require(:appointment).permit(:name, :phone, :date)
   end
end
