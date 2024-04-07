class PasswordResetsController < ApplicationController

  def new

  end

  def create
      @user = User.find_by(email: params[:email])

      if @user.present?
          #メールを送る
          PasswordResetMailer.with(user: @user).reset.deliver_later
          redirect_to root_path
          flash[:success] = "パスワードリセットメールを送りました。"
      else
          redirect_to password_reset_path
          flash[:danger] = "メールアドレスが見つかりませんでした。"
      end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to password_reset_path
        flash[:danger] = "URLの有効期限が切れています。もう一度リクエストお願いします。"
end

def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to root_path
      flash[:success] = "パスワードをリセットしました。"
    else
        
        flash[:danger] = "パスワードのリセットに失敗しました。"
        render :edit
    end
  end

private

def password_params
    params.require(:user).permit(:password, :password_confirmation)
end

end