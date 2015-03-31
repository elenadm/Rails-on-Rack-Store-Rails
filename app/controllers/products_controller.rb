class ProductsController < ApplicationController
  before_action :find_product, only: [:show]

  def index
    @products = Product.order(:name).page params[:page]
  end

  def show
  end

  def cart_session
    session[:cart] ||= []
    session[:cart] << params[:id]
    redirect_to products_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :image_url, :price)
  end
end
