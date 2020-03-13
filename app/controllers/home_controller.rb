class HomeController < ApplicationController
  def index
    @services = Service.order('rand ()').limit(3)
    @products = Product.order('rand ()').limit(3)
    @service = Service.order('rand ()').limit(6)
  end
end
