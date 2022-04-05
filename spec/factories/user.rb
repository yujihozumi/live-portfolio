FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    user_body { Faker::Lorem.sentence }
    password {"00000000"}
    password_confirmation {"00000000"}
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/icon.jpeg')) }
  end
end
