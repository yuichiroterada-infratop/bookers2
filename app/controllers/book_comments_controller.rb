class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(comment_params)
    comment.user = current_user
    comment.book = book
    if comment.save
      flash[:notice] = "You have posted comment successfully!"
      redirect_to request.referer
    else
      @book = Book.find(params[:book_id])
      @user = @book.user
      @new_book = Book.new
      @book_comment = BookComment.new
    end
  end
  
  def destroy
    BookComment.find(params[:id]).destroy
    flash[:notice] = "You have destroyed comment successfully!"
    redirect_to request.referer
  end
  
  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
