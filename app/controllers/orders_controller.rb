class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :create, :edit, :update, :destroy]

    # GET /orders
    # GET /orders.json
    def index
      @orders = current_user.orders.all
    end

    # GET /orders/1
    # GET /orders/1.json
    def show
    end

    # GET /orders/new
    def new
      @order = Order.new(shipping_address: current_user.address)
      if params[:product_id].present?
        @products = Product.where(id: params[:product_id])
      elsif session[:products].present?
        @products = Product.where(id: session[:products])
      else
        redirect_to root_path
      end
    end

    # GET /orders/1/edit
    def edit
    end

    # POST /orders
    # POST /orders.json
    def create
      @products = Product.where(id: params[:products])
      @order = current_user.orders.new(order_params)
      respond_to do |format|
        if @order.save
          @products.each do |product|
            @order.order_products.create(product_id: product.id)
          end
          @order.update(total: @order.order_products.sum(:total))
          session[:products] = []
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /orders/1
    # PATCH/PUT /orders/1.json
    def update
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { render :edit }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /orders/1
    # DELETE /orders/1.json
    def destroy
      @order.destroy
      respond_to do |format|
        format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = current_user.orders.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def order_params
        params.require(:order).permit(:shipping_address, :payment_id, :payment_mode)
      end
  end
