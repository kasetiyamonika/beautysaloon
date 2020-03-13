class Appointment < ApplicationRecord
  validates :payment_mode, acceptance: { accept: ['Cash', 'Cheque', 'Cash Online'] }
  # validates :status, acceptance: { accept: ['booked', 'In-progress','Finised','Cancled'] }
  validates :remark, length: { minimum: 2, maximum: 500 } ,presence: true

  belongs_to :user
  belongs_to :service

  #
  # after_create :appointment_send
  # def appointment_send
  #   AppointmentMailer.appointment_send(self).deliver
  #   redirect_to root_path, alert: "Thank you for the creat Appointment"
  # end

  # after_commit :send_conformation_mail, on: :create
  # def send_conformation_mail
  #   AppointmentMailer.with(appointment_id: id).appointment_send.deliver_now
  # end

  after_initialize :set_default
  def set_default
     self.start_time = Time.now
   end

   after_initialize :set_default
   def set_default
      self.end_time = Time.now
    end
end
