class UsersController < ApplicationController

  def new 
    render 'new.html.erb'
    
  end

  def create 
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save 
      session[:user_id] = user.id 
      flash[:success] = "You've successfully created an account!!"
      redirect_to '/'
    else 
      flash[:warning] = "Invalid email or password!"
      redirect_to '/signup'
    end 
  end
end
