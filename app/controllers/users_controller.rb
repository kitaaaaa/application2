class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end

  def index
  	@user = current_user
  	@book = Book.new
  end

  def create
  	user = User.find(params[:id])
  	book = Book.new(book_params)
  	if book.save
      flash[:notice] = "You have creatad book successfully."
  	  redirect_to book_path(@book.id)
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path(@user.id)
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
