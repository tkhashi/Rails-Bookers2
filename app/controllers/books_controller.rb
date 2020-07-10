class BooksController < ApplicationController
before_action :authenticate_user!
# before_action :correct_user, only: [:edit, :update, :destroy]




  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user

  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have creatad book successfully."
    else
      @books = Book.all
      render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully updated."
  else
    render "edit"
  end
end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_index_path
    end
  end




  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  # # before_action
  # def correct_user
  #   user = User.find(params[:id])
  #   redirect_to root_url if current_user != user
  # end


end
