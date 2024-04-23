require 'user_mailer'

class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    # ユーザーに関連付けられたブログを取得し、設定日時が現在の時刻に近いものから順に並べ替える
    blogs = user.blogs.where('start_time <= ?', Time.now).order(start_time: :asc)
    # 未送信のブログのうち、最初のものを取得
    unsent_blog = blogs.find_by(blog_sent: false)
    if unsent_blog.present?
      # メールを送信
      UserMailer.notification_email(user, unsent_blog).deliver_now
      # ブログの送信済み状態を更新
      unsent_blog.update(blog_sent: true)
    end
  end
end