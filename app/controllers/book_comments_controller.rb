class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(comment_params)
    comment.user = current_user
    comment.book = book
    comment.save
    redirect_to request.referer
  end
  
  def destroy
    book = Book.find(params[:book_id])
    
    
  end
  
  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
