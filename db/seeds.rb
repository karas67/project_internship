60.times do
  Detail.create!([{
    name: Faker::Food.fruits,
    price: Faker::Number.number(digits: 4),
    quantity: Faker::Number.number(digits: 4)
  }])
end