class GuestsCleanupJob < ApplicationJob
queue_as :default

  def perform(id)
    AppointmentMailer.with(appointment_id: id).appointment_send.deliver_now
    puts "hello job action"
  end
end
