FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { 'Test1234' }
    password_confirmation { 'Test1234' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    confirmed_at { 1.day.ago }
  end
end
