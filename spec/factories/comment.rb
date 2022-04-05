FactoryBot.define do
  factory :comment do
    id {'1'}
    comment {Faker::Lorem.words}
    association :user
    association :post
  end
end
