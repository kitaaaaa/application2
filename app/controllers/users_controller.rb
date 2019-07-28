class UsersController < ApplicationController
    before_action :ensure_correct_user, only: [:edit, :update]
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user.id)
    end 
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end

  def index
  	@user = current_user
    @users = User.all
  	@book = Book.new
  end

  def create
  	user = User.find(params[:id])
  	book = Book.new(book_params)
  	book.save
  	redirect_to book_path(@book.id)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error"
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
