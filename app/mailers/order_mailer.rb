class OrderMailer < ApplicationMailer

  default from: 'kasetiyamonika@gmail.com'


  def order_send
    @order = Order.find_by(id: params[:order_id])
    @url  = 'http://example.com/login'
    mail(to: @order.user.email, subject: 'Welcome to My this Site!! confrim to your order')
  end

end
