class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user 
    @current_user ||= User.find_by(id:session[:user_id]) if session[:user_id]
  end 
  helper_method :current_user

  def authenticate_user!
    unless current_user
      flash[:danger] = "Access Denied"
      redirect_to "/" 
    end 
  end 

   def shopping_cart
    if current_user && current_user.orders.find_by(completed: false)
      return current_user.orders.find_by(completed: false).carted_products.count
    else 
      return ""
    end 
    
  end

  helper_method :current_user, :shopping_cart


   def authenticate_seller!
    unless current_user && current_user.seller_profile || current_user.admin
      flash[:danger] = "Access Denied"
      redirect_to "/"
    end
  end
  

  def authenticate_admin! 
    unless current_user && current_user.admin 
      flash[:danger] = "Access Denied"
      redirect_to "/"
    end 
  end 
end
