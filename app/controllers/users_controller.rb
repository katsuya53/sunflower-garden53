class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(@user, bypass: true) # ユーザーを再認証してセッションを維持
      redirect_to root_path
    else
      render :edit
    end
  end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path, notice: "ユーザーが削除されました。"
    end

  


  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :prefecture_id, :image)
  end

end