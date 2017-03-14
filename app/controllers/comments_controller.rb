class CommentsController < ApplicationController

 def index 
    @comments = Comment.all 
  end 

  def show 
   @comment = Comment.find_by(id: params[:id]) 
  end 

  def new 

  end  

  def create
    product_id = params[:product_id]
    comment = params[:comment]
    comment = Comment.new({product_id: product_id, comment: comment, user_id: current_user.id})
    comment.save 
    redirect_to "/products/#{comment.product.id}" 
    flash[:success] = " Your comment was created!"
  end 

  # def edit 
  #   @comment = Comment.find_by(id: params[:id])
  # end

  # def update
  #   comment = Comment.find_by(id: params[:id])
  #   comment.comment = params[:comment]
  #   comment.save
  #   flash[:success] = "Comment Updated"
  #   redirect_to "/comments/#{comment.id}"
  # end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.product_id = params[:product_id]
    @comment.commnet = params[:comment]
    @comment.save 
    flash[:danger] = "Comment Deleted"
    redirect_to "/products/#{@comment.product.id}" 

  end 
end
