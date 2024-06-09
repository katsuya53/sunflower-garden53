FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + '1a' } # 英数字の混合を末尾に追加
    password_confirmation { password }
    prefecture_id          { Faker::Number.between(from: 2, to: 48) } # 2から48までのランダムな数値を生成してidに設定
  end
end
