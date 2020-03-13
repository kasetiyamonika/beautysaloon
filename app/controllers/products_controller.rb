class ProductsController < ApplicationController
  def index
    page = params[:page].to_i > 0 ? params[:page] : 1
    @products = Product.page(page).per(6)
    @products = @products.where('products.name like ?', "%#{params[:name]}%") if params[:name].present?
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
