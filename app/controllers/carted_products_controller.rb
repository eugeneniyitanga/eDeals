class CartedProductsController < ApplicationController
  before_action :authenticate_user!

  def index
  
    @carted_products = CartedProduct.all
    
    orders = Order.where("user_id = ? AND completed = ?", current_user.id, false)
    @order = current_user.orders.find_by(completed: false)
    unless @order
      flash[:warning] = "Your Cart is Empty!"
      redirect_to "/"
    end
  end

  def create
     orders = Order.where("user_id = ? AND completed = ?", current_user.id, false)
     if orders.first
      order = orders.first 

    else 
      order = Order.new(user_id: current_user.id, completed: false)
      order.save 
    end 
    if current_user
      cart = CartedProduct.new(order_id: order.id, product_id:params[:product_id], quantity:params[:quantity])
      cart.save
      redirect_to "/carted_products"
    else 
      flash[:warning] = "Login to order products!"
      redirect_to "/Login"
    end
  end 

  def destroy 
    cart = CartedProduct.find_by(id: params[:id])
    cart.destroy 
    flash[:danger] = "Product removed from cart!"
    redirect_to "/carted_products"
  end
end
