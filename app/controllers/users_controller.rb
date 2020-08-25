class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path
  end

  def index
    #これでいけるか？
    @user = User.find(current_user.id)

    @users = User.all
    @new = Book.new
  end

  def show
    @user = User.find(params[:id])
    #ここにBookからの情報を記載
    @books = @user.book.page(params[:page])
    #これで行けるか？
    @new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
end
