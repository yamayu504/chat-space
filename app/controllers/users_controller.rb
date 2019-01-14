class UsersController < ApplicationController
  def index
    # ここで本来ならばグループメンバーを弾くべきだが、editとnewが共存する_form.html.hamlでの実現方法がわからない。。。
    @users     = User.where('user_name LIKE(?)', "%#{params[:keyword]}%").where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

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
