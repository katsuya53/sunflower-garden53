class PasswordResetsController < ApplicationController

  def new

  end

  def create
      @user = User.find_by(email: params[:email])

      if @user.present?
          #メールを送る
          PasswordResetMailer.with(user: @user).reset.deliver_later
          flash[:success] = "リクエストありがとうございます。パスワードリセットメールを送りました。"
          redirect_to root_path
      else
          flash[:danger] = "メールアドレスを見つかりませんでした。ご確認お願いします。"
          render :new
      end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        flash[:danger] = "URLの有効期限が切れています。もう一度リクエストお願いします。"
        redirect_to password_reset_path
end

def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
        flash[:success] = "パスワードをリセットされました。ログインしてください。"
  redirect_to root_path
    else
        render :edit
    end
end

private

def password_params
    params.require(:user).permit(:password, :password_confirmation)
end

end