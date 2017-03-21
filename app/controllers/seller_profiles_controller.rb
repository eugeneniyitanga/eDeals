class SellerProfilesController < ApplicationController

  def new 
  end 

  def create

    first_name = params[:first_name],
    last_name = params[:last_name],
    phone_number = params[:phone_number],
    location = params[:location],
    street_code = params[:street_code]
    seller_profile = SellerProfile.new(first_name: first_name, last_name: last_name, phone_number: phone_number, location: location, street_code: street_code)
    seller_profile.save 
    redirect_to ""

  end 

end
