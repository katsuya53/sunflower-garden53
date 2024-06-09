FactoryBot.define do
  factory :post do
    post_title { Faker::Lorem.sentence }
    post_text { Faker::Lorem.sentence }
    association :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end