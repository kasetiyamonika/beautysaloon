class HomeController < ApplicationController
  def index
    @services = Service.take(6)
    @products = Product.take(3)
    @service = Service.take(6)
  end
end
