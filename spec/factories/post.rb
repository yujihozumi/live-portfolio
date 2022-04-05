FactoryBot.define do
  factory :post do
    title {"test"}
    body { Faker::Lorem.sentence }
    artist { Faker::Music::RockBand.name }
    live_venue { Faker::Address.state }
    start_date {"2020/01/01"}
    end_date {"2020/01/02"}
    start_time {"10:10"}
    ending_time {"11:10"}
    user
    after(:build) do |post|
      post.photos << build(:photo)
    end
  end
end
