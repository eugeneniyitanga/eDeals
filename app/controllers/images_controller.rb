class ImagesController < ApplicationController

  # def index  
  #   @images = Image.all 
  #   render "index.html.erb" 
  # end 

  # def show 
  # @image = Image.find_by(id: params[:id])
  #   if params[:id] == "random"
  #     @image = Image.all.sample
  #   else 
  #     @image = Image.find_by(id: params[:id])
  #   end 
  # end

  # def new
  #   @image = Image.new 
  #   end
  # end 

  # def search 
  # #   search_query = params[:search_query]
  # #   @image = Image.where("name ILIKE ? OR brand ILIKE ?", "%#{search_query}%", "%#{search_query}%")
  # #   if @images.empty?
  # #     flash[:info] = "No #{search_query} found" 
  # #   end 
  # #   render :index
  # # end 

#   def create 
# #     name = params[:name]
# #     brand = params[:brand]
# #     price = params[:price]
# #     product = Product.new({name: name, brand: brand, price: price})
# #     product.save
# #     redirect_to "/products/#{product.id}" 
# #     flash[:success] = "Product Created"
# #   end 

# #   def edit
# #     @product = Product.find_by(id: params[:id])
# #   end

# #   def update
# #     product = Product.find_by(id: params[:id])
# #     product.name = params[:name]
# #     product.brand = params[:brand]
# #     product.price = params[:price]
# #     product.save
# #     flash[:ohh] = "Product Updated"
# #     redirect_to "/products/#{product.id}"
# #   end

# #   def destroy 
# #     product = Product.find_by(id: params[:id])
# #     product.name = params[:name]
# #     product.brand = params[:brand]
# #     product.price = params[:price]
# #     product.save
# #     flash[:warning] = "Product Deleted"
# #     redirect_to "/products/#{product.id}"
# #    end 
# # end
# # end
