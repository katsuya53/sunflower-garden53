class UserMailer < ApplicationMailer
  def notification_email(user, blog)
    @user = user
    @blog = blog
    mail(to: @user.email, subject: 'カレンダー通知')
  end
end