class SessionsController < ApplicationController

  def new
    render 'new.html.erb'
  end

  def create
    user = User.find_by(email: params[:email])
   if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.seller_profile 
        redirect_to "/seller_profiles/#{user.seller_profile.id}"
      else 
        flash[:success] = "Welcome back #{user.first_name}!" 
        redirect_to '/'
      end 
    else 
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/login'
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end
end
