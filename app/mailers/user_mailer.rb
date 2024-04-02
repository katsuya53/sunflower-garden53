class UserMailer < ApplicationMailer
  def sample_email(email)
    mail(to: email, subject: 'テストメール送信')
  end
end