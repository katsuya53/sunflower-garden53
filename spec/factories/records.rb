FactoryBot.define do
  factory :record do
    record_text { Faker::Lorem.sentence }
    association :user
    association :category

    after(:build) do |record|
      record.record_image.attach(io: File.open(Rails.root.join('public/images/test_image.png')), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
