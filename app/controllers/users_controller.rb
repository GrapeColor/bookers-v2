class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book_new = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book_new = Book.new
  end

  # registrations#editへリダイレクト
  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'successfully'
    else
      flash.now[:notice] = 'error'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
