class SellerProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :edit, :update, :destroy]

  def index  
  end

  def new 
  end 

  def show 
    @products = current_user.seller_profile.products 
  end

  def create
    seller_profile = current_user
    company_name = params[:company_name],
    phone_number = params[:phone_number],
    company_email =params[:company_email],
    location = params[:location],
    street_code = params[:street_code]

    seller_profile = SellerProfile.new(company_name: company_name, phone_number: phone_number, company_email: company_email, location: location, street_code: street_code, user_id: current_user.id)

    if @seller_profile.save 
    redirect_to "/seller_profiles/#{seller_profile.id}"

    else 
      render 'new'
    end 
  end 

end
