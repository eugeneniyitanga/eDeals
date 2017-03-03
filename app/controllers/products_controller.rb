class ProductsController < ApplicationController
   # before_action :authenticate_user!, except: [:index, :show, :search]
   # before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index 
    @products = Product.all 
  end 

  def show 
   @product = Product.find_by(id: params[:id]) 
  end 

  def new 
  end 
  
  def search 
    search_query = params[:search_query]
    @products = Product.where("name ILIKE ? OR description ILIKE ?", "%#{search_query}%", "%#{search_query}%")
    if @products.empty?
      flash[:info] = "No search matches #{search_query} found" 
    end 
    render :index
  end 

  def create 
    name = params[:name]
    description = params[:description]
    price = params[:price]
    product = Product.new({name: name, description: description, price: price})
    product.save 
    redirect_to "/products/#{product.id}" 
    flash[:success] = "Product Created"
  end 

  def edit 
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name]
    product.description = params[:description]
    product.price = params[:price]
    product.save
    flash[:success] = "Product Updated"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.description = params[:description]
    @product.price = params[:price]
    @product.save 
    flash[:warning] = "Product Deleted"
    redirect_to "/products/#{@product.id}" 

  end 
  
end
