class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:image].present? # 画像が選択されている場合
      @user.image.purge # 現在の画像を削除
    else # 画像が選択されていない場合
      params[:user].delete(:image) # パラメーターから画像情報を削除
    end
    if @user.update(user_params)
      sign_in(@user, bypass: true) # 編集完了後にログアウトしないよう再認証してセッションを維持
      redirect_to root_path, notice: 'ユーザー情報が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

    def destroy
      @user = User.find(params[:id])
      @user.posts.destroy_all  # ユーザーに関連付けられている投稿を削除
      @user.destroy
      redirect_to root_path, notice: "ユーザーが削除されました。"
    end

  


  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :prefecture_id, :image)
  end

end