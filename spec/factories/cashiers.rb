FactoryBot.define do
  factory :cashier do
    first_name { Faker::Movies::Hobbit.character }
    last_name { "MyString" }
    email { Faker::Internet.email }
    password { "MyString" }
  end
end
