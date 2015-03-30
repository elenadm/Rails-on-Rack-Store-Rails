class OrdersController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create]
  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end


  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    session[:cart].each do |el|
      @order.products << Product.find(el)
    end
    respond_to do |format|
      if @order.save
        format.html { redirect_to products_path, notice: 'Order was successfully created.' }
      else
        format.html { redirect_to products_path, notice: 'Sorry, your order is not issued. Please try again.' }
      end
    end
  end

  def destroy
    @order.destroy
    session[:cart] = nil
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:buyer, :address, :email)
  end
end
