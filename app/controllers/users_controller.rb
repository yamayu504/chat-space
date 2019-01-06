class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update( user_params )
      redirect_to root_path , notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:user_name, :email)
  end
end
