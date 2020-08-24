class BooksController < ApplicationController
  #def new
    #@book = Book.new
  #end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    #redirect_to books_path
    redirect_to book_path(@book.id)
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  @book = Book.find(params[:id])
  @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
     #flash[:notice] = "error : Book was not updated."
     render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end