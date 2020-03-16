class HomeController < ApplicationController
  def index
    @services = Service.order.take(6)
    @products = Product.order.take(3)
    @service = Service.order.take(6)
  end
end
