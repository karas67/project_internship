FactoryBot.define do
  factory :order_detail do
    order { nil }
    detail { nil }
    amount { 1.5 }
    quantity { 1 }
  end
end
