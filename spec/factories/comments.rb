FactoryBot.define do
  factory :comment do
    comment_text { Faker::Lorem.sentence }
    association :user
  
  end
end