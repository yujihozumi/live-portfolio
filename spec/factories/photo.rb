FactoryBot.define do
  factory :photo do
    image { File.open("#{Rails.root}/spec/fixtures/test.jpg") }
  end
end
