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

  def show
    @user = User.find(params[:id])
    #ここにBookからの情報を記載？
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
    params.require(:user).permit(:name, :body, :introduction,:profile_image)
  end
end
