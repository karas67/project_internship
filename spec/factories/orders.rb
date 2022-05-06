FactoryBot.define do
  factory :order do
    date { "2022-04-20" }
    name { Faker::Movies::Hobbit.character }
    amount { 1.5 }
  end
end
