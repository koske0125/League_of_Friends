class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to root_path
    else
      flash[:alert] = "不正なアクセスです"
      redirect_to root_path
    end
  end

    private

    def user_params
      params.require(:user).permit(:summoner_name, :email, :password)
    end
end
