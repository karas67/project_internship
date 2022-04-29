FactoryBot.define do
  factory :manager do
    first_name { Faker::Movies::Hobbit.character }
    last_name { "MyString" }
    email { Faker::Internet.email }
    password { "MyString" }
  end
end
