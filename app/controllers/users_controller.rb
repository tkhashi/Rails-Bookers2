class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]


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
    @book = Book.find(params[:id])
    @user = User.find(params[:id])


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

  def current_user
  User.find_by(id: session[:user_id])
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @micropost = current_user.find_by(id: params[:id])
      unless @micropost
        redirect_to users_path
      end
  end



end
