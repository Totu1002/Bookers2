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
    @user = User.find(current_user.id)
    @users = User.all
    @new = Book.new
  end

  def show
    @user = User.find(params[:id])
    #ここにBookからの情報を記載
    @books = @user.books.page(params[:page])
    @new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error."
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
end
