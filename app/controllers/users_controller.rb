class UsersController < ApplicationController
  def index
    search_users     = User.where('user_name LIKE(?)', "%#{params[:keyword]}%")
    # ここで本来ならばグループメンバーを弾くべきだが、editとnewが共存する_form.html.hamlでの実現方法がわからない。。。
    search_users_ids = search_users.ids.select do |x|
      x != current_user.id
    end
    @users = User.where(id: search_users_ids).limit(10)
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
