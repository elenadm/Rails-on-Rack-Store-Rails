class CartsController < ApplicationController

  def cart_session
    session[:cart] ||= []
    session[:cart] << params[:id]
    redirect_to products_path
  end

end
