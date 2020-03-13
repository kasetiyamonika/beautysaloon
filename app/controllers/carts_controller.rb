class CartsController < ApplicationController

  def index
    @products = Product.where(id: session[:products])
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product.present?
      session[:products] ||= []
      session[:products] << @product.id  unless session[:products].include?(@product.id)
    end

    flash[:alert] = 'Product added to cart successfully!'
    redirect_to carts_path
  end
end
