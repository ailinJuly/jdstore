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
        flash[:alert]= "您已经成功提交预约单，请等候客服电话..."
        redirect_to root_path

      else
        render :new
      end
  end

private
   def appoint_params
      params.require(:appointment).permit(:name, :phone, :date)
   end
end
