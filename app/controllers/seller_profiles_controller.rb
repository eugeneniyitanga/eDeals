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

    street_code = params[:street_code]
    coordinates = Geocoder.coordinates(street_code)

    seller_profile = SellerProfile.new(
      company_name: params[:company_name], 
      phone_number: params[:phone_number], 
      company_email: params[:company_email], 
      location: params[:location], 
      street_code: street_code,
      latitude: coordinates[0],
      longitude: coordinates[1],
      user_id: current_user.id
      )

    if @seller_profile.save 
    redirect_to "/seller_profiles/#{seller_profile.id}"

    else 
      render 'new'
    end 
  end 

  def edit 
    @seller_profile = SellerProfile.find_by(id: params[:id])
  end
   
  

  def update
    seller_profile = SellerProfile.find_by(id: params[:id])

    street_code = params[:street_code]
    coordinates = Geocoder.coordinates(street_code)

    seller_profile.update(
    company_name: params[:company_name],
    phone_number: params[:phone_number],
    company_email: params[:company_email],
    location: params[:location],
    street_code: street_code,
    latitude: coordinates[0],
    longitude: coordinates[1]
    )

    flash[:success] = "Profile Updated!"
    redirect_to "/seller_profiles/#{seller_profile.id}"
  end 

end
