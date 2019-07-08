class UsersController < ApplicationController
  def index
  end

  def show
  end

  # registrations#editへリダイレクト
  def edit
    user = User.find(params[:id])
    if user.id == current_user.id
      redirect_to edit_user_registration_path
    else
      redirect_to user_path(current_user)
    end
  end
end
