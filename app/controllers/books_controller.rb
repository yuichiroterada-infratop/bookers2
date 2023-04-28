class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  def edit
  end
  
  def create
    book = Book.new(book_params)
    book.user = current_user
    if book.save
      flash[:notice] = "You have created book successfully!"
      redirect_to book_path(book)
    else
      render "books/index"
    end
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
