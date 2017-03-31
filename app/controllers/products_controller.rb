class ProductsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show, :search]
   
   

  def index 
    if params[:category].blank?
      @products = Product.paginate(:page => params[:page], :per_page => 6).order("created_at DESC")
      # @products = Product.all.order("created_at DESC")
    else 
       @category_id =  Category.find_by(name: params[:category]).id
       @products = Product.where(category_id: @category_id).order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
    end
  end 

  def show 
   @product = Product.find_by(id: params[:id]) 
  end 

  def new 
  end 
  
  def search 
    search_query = params[:search_query]
    @products = Product.where("name ILIKE ? OR description ILIKE ?", "%#{search_query}%", "%#{search_query}%").paginate(:page => params[:page], :per_page => 6)
    if @products.empty?
      flash[:info] = "No search matches #{search_query} found" 
    end 
    render :index
  end 

  def create 
    name = params[:name]
    description = params[:description]
    price = params[:price]
    quantity = params[:quantity]
    image = params[:image]
    product = Product.new({name: name, description: description, price: price, quantity: quantity, image: image})

    product.seller_profile_id = current_user.seller_profile.id

    if product.save     
    redirect_to "/seller_profiles/#{current_user.seller_profile.id}"
    flash[:success] = "Product Created"
    else 
      flash[:danger] = "You've no access to add products"
    end 
  end 

  def edit 
    product = Product.find_by(id: params[:id])
      if current_user && current_user.seller_profile && current_user.seller_profile.products.include?(product) || current_user.admin
        @product = product 

      else
        flash[:warning] = "access denied"
        redirect_to "/"
    end
  end

  
  def update
    @product = Product.find_by(id: params[:id])
      if @product.update({name: params[:name], description: params[:description], quantity: params[:quantity], price: params[:price], image: params[:image], category_id: params[:category]})
        flash[:success] = "Product Updated!"
        redirect_to "/products/#{@product.id}"
      else 
        render 'edit'
      end  
  end

  def destroy
    @product = Product.find_by(id: params[:id])

    @product.destroy
    
    flash[:warning] = "Product Deleted"
     redirect_to "/seller_profiles/#{current_user.seller_profile.id}"

  end 
  
end
