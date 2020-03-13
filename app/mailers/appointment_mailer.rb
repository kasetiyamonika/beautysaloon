class AppointmentMailer < ApplicationMailer

  default from: 'kasetiyamonika@gmail.com'

  def test_mail
    mail(to: params[:email], subject: "test the checked")
  end

  def appointment_send
    @appointment = Appointment.find_by(id: params[:appointment_id])
    @url  = 'http://example.com/login'
    # email_with_name = %("#{@appointment.user.first_name}" <#{@appointment.user.email}>)
    # mail(to: email_with_name, subject: 'Welcome to My this Site!! confrim to your appointment')
    mail(to: @appointment.user.email, subject: 'Welcome to My this Site!! confrim to your appointment')
  end
end
