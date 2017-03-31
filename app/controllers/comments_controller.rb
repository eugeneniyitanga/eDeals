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

    def edit 
    @comment = Comment.find_by(id: params[:id])
  end
   
  

  def update
    comment = Comment.find_by(id: params[:id])


    comment.update(
    comment: params[:comment]
    )

    flash[:success] = "Comment Updated!"
    redirect_to "/products/#{comment.product.id}"
  end 

   def destroy
    comment = Comment.find_by(id: params[:id])
    if current_user.comments.include?(comment)
      comment.destroy
      redirect_to :back
    else
      flash[:warning] = "access denied"
      redirect_to :back
    end
  end 
end
