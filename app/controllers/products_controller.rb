class ProductsController < ApplicationController
  before_action :find_product, only: [:show]

  def index
    @products = Product.all
  end

  def show
    @product = find_product
  end

  private

  def find_product
    Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :image_url, :price)
  end
end
