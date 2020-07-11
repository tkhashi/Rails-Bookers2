class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all
    @book = Book.new
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
    @book = Book.new
    @user1 = User.find(params[:id])
    @books = @user1.books
    @user = current_user

  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render "edit"
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end



end
