FactoryBot.define do
  factory :blog do
    blog_title { Faker::Lorem.sentence }
    blog_text { Faker::Lorem.sentence }
    association :user
    
  end
end