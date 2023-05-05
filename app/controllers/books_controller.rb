class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    user = @book.user
    if user != current_user
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully!"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      flash[:notice] = "You have created book successfully!"
      redirect_to book_path(@book)
    else
      @books = Book.all
      render "books/index"
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "You have destroyed book successfully!"
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
